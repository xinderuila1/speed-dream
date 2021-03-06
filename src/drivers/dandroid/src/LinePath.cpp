/***************************************************************************

    file        : LinePath.cpp
    created     : 9 Apr 2006
    copyright   : (C) 2006 Tim Foden, 2013 D.Schellhammer

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/


#include "LinePath.h"
#include "Utils.h"

#include <robottools.h>


LinePath::LinePath() : m_pTrack(0), m_pPath(0)
{
}

LinePath::~LinePath()
{
 delete [] m_pPath;
}

LinePath& LinePath::operator=( const LinePath& path )
{
  m_pTrack = path.m_pTrack;

  const int NSEG = m_pTrack->GetSize();

  delete [] m_pPath;
  m_pPath = new PathPt[NSEG];
  memcpy( m_pPath, path.m_pPath, NSEG * sizeof(PathPt) );

  return *this;
}

void LinePath::Set( const LinePath& path )
{
  m_pTrack = path.m_pTrack;
  const int NSEG = m_pTrack->GetSize();

  delete [] m_pPath;
  m_pPath = new PathPt[NSEG];

  m_maxL = path.m_maxL;
  m_maxR = path.m_maxR;

  memcpy( m_pPath, path.m_pPath, NSEG * sizeof(*m_pPath) );
}

void LinePath::Initialise( MyTrack* pTrack, double maxL, double maxR )
{
  const int NSEG = pTrack->GetSize();

  m_pTrack = pTrack;
  delete [] m_pPath;
  m_pPath = new PathPt[NSEG];

  m_maxL = maxL;
  m_maxR = maxR;

  for( int i = 0; i < NSEG; i++ )
  {
    m_pPath[i].pSeg = &(*pTrack)[i];
    m_pPath[i].k = 0;
    m_pPath[i].kz = 0;
    m_pPath[i].offs = m_pPath[i].pSeg->midOffs;
    m_pPath[i].pt = m_pPath[i].CalcPt();
    m_pPath[i].maxSpd = 10;
    m_pPath[i].spd = 10;
    m_pPath[i].accSpd = 10;
    m_pPath[i].h = 0;
    m_pPath[i].lBuf = 0;
    m_pPath[i].rBuf = 0;
  }

  CalcCurvaturesXY();
  CalcCurvaturesZ();
}

const LinePath::PathPt& LinePath::GetAt( int idx ) const
{
  return m_pPath[idx];
}

void LinePath::CalcCurvaturesXY( int start, int len, int step )
{
  const int NSEG = m_pTrack->GetSize();

  for( int count = 0; count < NSEG; count++ )
  {
    int  i  = (start + count) % NSEG;
    int  ip = (i - step + NSEG) % NSEG;
    int  in = (i + step) % NSEG;

    m_pPath[i].k = Utils::CalcCurvatureXY( m_pPath[ip].CalcPt(), m_pPath[i ].CalcPt(), m_pPath[in].CalcPt() );
  }
}

void LinePath::CalcCurvaturesZ( int start, int len, int step )
{
  const int NSEG = m_pTrack->GetSize();

  for( int count = 0; count < NSEG; count++ )
  {
    int  i  = (start + count) % NSEG;
    int  ip = (i - 3 * step + NSEG) % NSEG;
    int  in = (i + 3 * step) % NSEG;

    m_pPath[i].kz = 6 * Utils::CalcCurvatureZ( m_pPath[ip].CalcPt(), m_pPath[i ].CalcPt(), m_pPath[in].CalcPt() );
  }
}

void LinePath::CalcCurvaturesXY( int step )
{
  const int NSEG = m_pTrack->GetSize();
  CalcCurvaturesXY( 0, NSEG, step );
}

void LinePath::CalcCurvaturesZ( int step )
{
  const int NSEG = m_pTrack->GetSize();
  CalcCurvaturesZ( 0, NSEG, step );
}

void LinePath::CalcFwdAbsK( int range)
{
  const int NSEG = m_pTrack->GetSize();

  int  count = range;
  int  i = count;
  int  j = i;
  double totalK = 0;

  while( i > 0 )
  {
    totalK += m_pPath[i].k;
    i--;
  }

  m_pPath[0].fwdK = totalK / count;
  totalK += fabs(m_pPath[0].k);
  totalK -= fabs(m_pPath[j].k);

  i = NSEG - 1;
  j--;
  if( j < 0 )
    j = NSEG - 1;

  while( i > 0 )
  {
    m_pPath[i].fwdK = totalK / count;
// GfOut( "***** i %d, k %7.4f fdwK %g  %6.1f\n",
// i, m_pPath[i].k, m_pPath[i].fwdK, 1 / m_pPath[i].fwdK );
    totalK += fabs(m_pPath[i].k);
    totalK -= fabs(m_pPath[j].k);

    i--;
    j--;
    if( j < 0 )
      j = NSEG - 1;
  }
}

double LinePath::CalcEstimatedTime( int start, int len ) const
{
  double totalTime = 0;

  const int NSEG = m_pTrack->GetSize();
  for( int s = 0; s < len; s++ )
  {
    int  i = (s + start) % NSEG;
    int  j = (i + 1) % NSEG;
    double dist = Utils::VecLenXY(m_pPath[i].CalcPt() - m_pPath[j].CalcPt());
    double spd = (m_pPath[i].accSpd + m_pPath[j].accSpd) * 0.5;
    double time = dist / spd;
    totalTime += time;
  }

  return totalTime;
}

double LinePath::CalcEstimatedLapTime() const
{
  double lapTime = 0;

  const int NSEG = m_pTrack->GetSize();
  for( int i = 0; i < NSEG; i++ )
  {
    int  j = (i + 1) % NSEG;
    double dist = Utils::VecLenXY(m_pPath[i].CalcPt() - m_pPath[j].CalcPt());
    double spd = (m_pPath[i].accSpd + m_pPath[j].accSpd) * 0.5;
    double time = dist / spd;
    lapTime += time;
  }

  return lapTime;
}
