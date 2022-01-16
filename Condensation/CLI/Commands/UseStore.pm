# BEGIN AUTOGENERATED

sub register($class, $cds, $help) {
	my $node000 = CDS::Parser::Node->new(0);
	my $node001 = CDS::Parser::Node->new(0);
	my $node002 = CDS::Parser::Node->new(0);
	my $node003 = CDS::Parser::Node->new(0);
	my $node004 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&help});
	my $node005 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&useStoreForMessaging});
	$cds->addArrow($node001, 1, 0, 'use');
	$help->addArrow($node000, 1, 0, 'messaging');
	$node000->addArrow($node004, 1, 0, 'store');
	$node001->addArrow($node002, 1, 0, 'STORE', \&collectStore);
	$node002->addArrow($node003, 1, 0, 'for');
	$node003->addArrow($node005, 1, 0, 'messaging');
}

sub collectStore($o, $label, $value) {
	$o:store = $value;
}

sub new($class, $actor) { bless {actor => $actor, ui => $actor->ui} }

# END AUTOGENERATED

# HTML FOLDER NAME use-store
# HTML TITLE Set the messaging store
sub help($o, $cmd) {
	my $ui = $o:ui;
	$ui->space;
	$ui->command('cds use STORE for messaging');
	$ui->p('Uses STORE to send and receive messages.');
	$ui->space;
}

sub useStoreForMessaging($o, $cmd) {
	$cmd->collect($o);

	$o:actor:configuration->setMessagingStoreUrl($o:store->url);
	$o:ui->pGreen('The messaging store is now ', $o:store->url);
}