# BEGIN AUTOGENERATED

sub register($class, $cds, $help) {
	my $node000 = CDS::Parser::Node->new(0);
	my $node001 = CDS::Parser::Node->new(0);
	my $node002 = CDS::Parser::Node->new(0);
	my $node003 = CDS::Parser::Node->new(0);
	my $node004 = CDS::Parser::Node->new(0);
	my $node005 = CDS::Parser::Node->new(0);
	my $node006 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&help});
	my $node007 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&suppress});
	my $node008 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&enable});
	my $node009 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&show});
	$cds->addArrow($node000, 1, 0, 'suppress');
	$cds->addArrow($node002, 1, 0, 'enable');
	$cds->addArrow($node004, 1, 0, 'show');
	$help->addArrow($node006, 1, 0, 'welcome');
	$node000->addArrow($node001, 1, 0, 'welcome');
	$node001->addArrow($node007, 1, 0, 'message');
	$node002->addArrow($node003, 1, 0, 'welcome');
	$node003->addArrow($node008, 1, 0, 'message');
	$node004->addArrow($node005, 1, 0, 'welcome');
	$node005->addArrow($node009, 1, 0, 'message');
}

sub new($class, $actor) { bless {actor => $actor, ui => $actor->ui} }

# END AUTOGENERATED

# HTML FOLDER NAME welcome
# HTML TITLE Welcome message
sub help($o, $cmd) {
	my $ui = $o:ui;
	$ui->space;
	$ui->command('cds suppress welcome message');
	$ui->p('Suppresses the welcome message when typing "cds".');
	$ui->space;
	$ui->command('cds enable welcome message');
	$ui->p('Enables the welcome message when typing "cds".');
	$ui->space;
	$ui->command('cds show welcome message');
	$ui->p('Shows the welcome message.');
	$ui->space;
}

sub suppress($o, $cmd) {
	$o:actor->localRoot->child('suppress welcome message')->setBoolean(1);
	$o:actor->saveOrShowError // return;

	$o:ui->space;
	$o:ui->p('The welcome message will not be shown any more.');
	$o:ui->space;
	$o:ui->line('You can manually display the message by typing:');
	$o:ui->line($o:ui->blue('  cds show welcome message'));
	$o:ui->line('or re-enable it using:');
	$o:ui->line($o:ui->blue('  cds enable welcome message'));
	$o:ui->space;
}

sub enable($o, $cmd) {
	$o:actor->localRoot->child('suppress welcome message')->clear;
	$o:actor->saveOrShowError // return;

	$o:ui->space;
	$o:ui->p('The welcome message will be shown when you type "cds".');
	$o:ui->space;
}

sub isEnabled($o) { ! $o:actor->localRoot->child('suppress welcome message')->isSet }

sub show($o, $cmd) {
	my $ui = $o:ui;
	$ui->space;
	$ui->title('Hi there!');
	$ui->p('This is the command line interface (CLI) of Condensation ', $CDS::VERSION, ', ', $CDS::releaseDate, '. Condensation is a distributed data system with conflict-free forward merging and end-to-end security. More information is available on https://condensation.io.');
	$ui->space;
	$ui->p('Commands resemble short english sentences. For example, the following "sentence" will show the record of an object:');
	$ui->line($ui->blue('  cds show record e5cbfc282e1f3e6fd0f3e5fffd41964c645f44d7fae8ef5cb350c2dfd2196c9f \\'));
	$ui->line($ui->blue('            from http://examples.condensation.io'));
	$ui->p('Type a "?" to explore possible commands, e.g.');
	$ui->line($ui->blue('  cds show ?'));
	$ui->p('or use TAB or TAB-TAB for command completion.');
	$ui->space;
	$ui->p('To get help, type');
	$ui->line($ui->blue('  cds help'));
	$ui->space;
	$ui->p('To suppress this welcome message, type');
	$ui->line($ui->blue('  cds suppress welcome message'));
	$ui->space;
}
