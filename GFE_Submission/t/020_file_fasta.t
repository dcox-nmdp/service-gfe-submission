=head1 NAME
 
   020_file_fasta.t

=head1 SYNOPSIS


=head1 AUTHOR     Mike Halagan <mhalagan@nmdp.org>
    
    Bioinformatics Scientist
    3001 Broadway Stree NE
    Minneapolis, MN 55413
    ext. 8225

=head1 LICENSE

    Copyright (c) 2016 National Marrow Donor Program (NMDP)

    This library is free software; you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 3 of the License, or (at
    your option) any later version.

    This library is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; with out even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
    License for more details.
 
    You should have received a copy of the GNU Lesser General Public License
    along with this library;  if not, write to the Free Software Foundation,
    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

    > http://www.gnu.org/licenses/lgpl.html

=cut
use Test::More tests => 6;
use strict;
use warnings;
use Data::Dumper;
# the order is important
use Dancer::Test;
use GFE_Submission;
use Dancer::Plugin::Swagger;
use GFE_Submission::Definitions;
use GFE_Submission::API;


my $pwd          = `pwd`;chomp($pwd);
my $t_file       = $pwd."/t/resources/fastatest1.fasta";
my $r_fasta_file = dancer_response POST => '/api/v1/fasta?locus=HLA-A', {files => [{name => 'file', filename => $t_file}]};

ok(defined $r_fasta_file->{content},"API successfully accepted a fasta file");
ok(defined $r_fasta_file->{content}->{subjects},"API successfully subject GFE results from fasta");
ok(defined $r_fasta_file->{content}->{subjects}[1],"size subjects > 0");
ok(defined $r_fasta_file->{content}->{subjects}[0]->{typingData}[0],"Subject typing data returned from fasta input");
ok(defined $r_fasta_file->{content}->{subjects}[0]->{typingData}[0]->{typing}[0],"Typing data returned from fasta input");
ok(defined $r_fasta_file->{content}->{subjects}[0]->{typingData}[0]->{typing}[0]->{gfe},"API successfully subject GFE results from fasta");












