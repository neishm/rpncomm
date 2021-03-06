!/* RPN_COMM - Library of useful routines for C and FORTRAN programming
! * Copyright (C) 1975-2015  Division de Recherche en Prevision Numerique
! *                          Environnement Canada
! *
! * This library is free software; you can redistribute it and/or
! * modify it under the terms of the GNU Lesser General Public
! * License as published by the Free Software Foundation,
! * version 2.1 of the License.
! *
! * This library is distributed in the hope that it will be useful,
! * but WITHOUT ANY WARRANTY; without even the implied warranty of
! * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
! * Lesser General Public License for more details.
! *
! * You should have received a copy of the GNU Lesser General Public
! * License along with this library; if not, write to the
! * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
! * Boston, MA 02111-1307, USA.
! */
!InTf!
        SUBROUTINE RPN_COMM_size( com, size ,ierr ) !InTf!
!	Luc Corbeil, 2002-11-21
!	mpi reduce

      implicit none                                 !InTf!
      integer, intent(OUT) :: ierr,size             !InTf!
      character(len=*), intent(IN) ::  com          !InTf!
      integer :: comm
      integer, external :: RPN_COMM_datyp,RPN_COMM_oper,RPN_COMM_comm
      logical, external :: RPN_COMM_grank
!*

      comm=rpn_comm_comm(com)
      if(.not.RPN_COMM_grank(com)) return
      call mpi_comm_size(comm, size, ierr)

      return
      end SUBROUTINE RPN_COMM_size                  !InTf!
