# BEGIN AUTOGENERATED

sub register($class, $cds, $help) {
	my $node000 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&help});
	my $node001 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&version});
	$cds->addArrow($node000, 0, 0, '--h');
	$cds->addArrow($node000, 0, 0, '--help');
	$cds->addArrow($node000, 0, 0, '-?');
	$cds->addArrow($node000, 0, 0, '-h');
	$cds->addArrow($node000, 0, 0, '-help');
	$cds->addArrow($node000, 0, 0, '/?');
	$cds->addArrow($node000, 0, 0, '/h');
	$cds->addArrow($node000, 0, 0, '/help');
	$cds->addArrow($node001, 0, 0, '--version');
	$cds->addArrow($node001, 0, 0, '-version');
	$cds->addArrow($node001, 1, 0, 'version');
}

sub new($class, $actor) { bless {actor => $actor, ui => $actor->ui} }

# END AUTOGENERATED

# HTML IGNORE
sub help($o, $cmd) {
	my $ui = $o:ui;
	$ui->space;
	$ui->title('Condensation CLI');
	$ui->line('Version ', $CDS::VERSION, ', ', $CDS::releaseDate, ', implementing the Condensation 1 protocol');
	$ui->space;
	$ui->p('Condensation is a distributed data system with conflict-free forward merging and end-to-end security. More information is available on ', $ui->a('https://condensation.io'), '.');
	$ui->space;
	$ui->p('The command line interface (CLI) understands english-like queries like these:');
	$ui->pushIndent;
	$ui->line($ui->blue('cds show key pair'));
	$ui->line($ui->blue('cds create key pair thomas'));
	$ui->line($ui->blue('cds get 45db86549d6d2af3a45be834f2cb0e08cdbbd7699624e7bfd947a3505e6b03e5 \\'));
	$ui->line($ui->blue('   and decrypt with 8b8b091bbe577d5e8d38eae9cd327aa8123fe402a41ea9dd16d86f42fb70cf7e'));
	$ui->popIndent;
	$ui->space;
	$ui->p('If you don\'t know how to continue a command, simply put a ? to see all valid options:');
	$ui->pushIndent;
	$ui->line($ui->blue('cds ?'));
	$ui->line($ui->blue('cds show ?'));
	$ui->popIndent;
	$ui->space;
	$ui->p('To see a list of help topics, type');
	$ui->pushIndent;
	$ui->line($ui->blue('cds help ?'));
	$ui->popIndent;
	$ui->space;
}

sub version($o, $cmd) {
	my $ui = $o:ui;
	$ui->line('Condensation CLI ', $CDS::VERSION, ', ', $CDS::releaseDate);
	$ui->line('implementing the Condensation 1 protocol');
}
