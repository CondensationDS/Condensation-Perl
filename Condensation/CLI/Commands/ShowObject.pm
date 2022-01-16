# BEGIN AUTOGENERATED

sub register($class, $cds, $help) {
	my $node000 = CDS::Parser::Node->new(0);
	my $node001 = CDS::Parser::Node->new(0);
	my $node002 = CDS::Parser::Node->new(0);
	my $node003 = CDS::Parser::Node->new(0);
	my $node004 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&help});
	my $node005 = CDS::Parser::Node->new(1);
	my $node006 = CDS::Parser::Node->new(0);
	my $node007 = CDS::Parser::Node->new(0);
	my $node008 = CDS::Parser::Node->new(0);
	my $node009 = CDS::Parser::Node->new(0);
	my $node010 = CDS::Parser::Node->new(1);
	my $node011 = CDS::Parser::Node->new(0);
	my $node012 = CDS::Parser::Node->new(0);
	my $node013 = CDS::Parser::Node->new(1, {constructor => \&new, function => \&show});
	$cds->addArrow($node000, 1, 0, 'show');
	$cds->addArrow($node001, 1, 0, 'show');
	$cds->addArrow($node003, 1, 0, 'show');
	$help->addArrow($node002, 1, 0, 'show');
	$node000->addArrow($node006, 1, 0, 'object', \&collectObject);
	$node001->addArrow($node006, 1, 0, 'record', \&collectRecord);
	$node002->addArrow($node004, 1, 0, 'bytes');
	$node002->addArrow($node004, 1, 0, 'data');
	$node002->addArrow($node004, 1, 0, 'hash');
	$node002->addArrow($node004, 1, 0, 'hashes');
	$node002->addArrow($node004, 1, 0, 'object');
	$node002->addArrow($node004, 1, 0, 'record');
	$node002->addArrow($node004, 1, 0, 'size');
	$node003->addArrow($node005, 1, 0, 'bytes', \&collectBytes);
	$node003->addArrow($node005, 1, 0, 'data', \&collectData);
	$node003->addArrow($node005, 1, 0, 'hash', \&collectHash);
	$node003->addArrow($node005, 1, 0, 'hashes', \&collectHashes);
	$node003->addArrow($node005, 1, 0, 'record', \&collectRecord);
	$node003->addArrow($node005, 1, 0, 'size', \&collectSize);
	$node005->addArrow($node003, 1, 0, 'and');
	$node005->addArrow($node006, 1, 0, 'of');
	$node006->addArrow($node007, 1, 0, 'HASH', \&collectHash1);
	$node006->addArrow($node010, 1, 1, 'FILE', \&collectFile);
	$node006->addArrow($node010, 1, 0, 'HASH', \&collectHash2);
	$node006->addArrow($node010, 1, 0, 'OBJECT', \&collectObject1);
	$node007->addArrow($node008, 1, 0, 'on');
	$node007->addArrow($node009, 0, 0, 'from');
	$node008->addArrow($node010, 1, 0, 'STORE', \&collectStore);
	$node009->addArrow($node010, 0, 0, 'STORE', \&collectStore);
	$node010->addArrow($node011, 1, 0, 'decrypted');
	$node010->addDefault($node013);
	$node011->addArrow($node012, 1, 0, 'with');
	$node012->addArrow($node013, 1, 0, 'AESKEY', \&collectAeskey);
}

sub collectAeskey($o, $label, $value) {
	$o:aesKey = $value;
}

sub collectBytes($o, $label, $value) {
	$o:showBytes = 1;
}

sub collectData($o, $label, $value) {
	$o:showData = 1;
}

sub collectFile($o, $label, $value) {
	$o:file = $value;
}

sub collectHash($o, $label, $value) {
	$o:showHash = 1;
}

sub collectHash1($o, $label, $value) {
	$o:hash = $value;
}

sub collectHash2($o, $label, $value) {
	$o:hash = $value;
	$o:store = $o:actor->preferredStore;
}

sub collectHashes($o, $label, $value) {
	$o:showHashes = 1;
}

sub collectObject($o, $label, $value) {
	$o:showHashes = 1;
	$o:showData = 1;
}

sub collectObject1($o, $label, $value) {
	$o:hash = $value->hash;
	$o:store = $value->cliStore;
}

sub collectRecord($o, $label, $value) {
	$o:showRecord = 1;
}

sub collectSize($o, $label, $value) {
	$o:showSize = 1;
}

sub collectStore($o, $label, $value) {
	$o:store = $value;
}

sub new($class, $actor) { bless {actor => $actor, ui => $actor->ui} }

# END AUTOGENERATED

# HTML FOLDER NAME show-object
# HTML TITLE Show objects
sub help($o, $cmd) {
	my $ui = $o:ui;
	$ui->space;
	$ui->command('cds show record OBJECT');
	$ui->command('cds show record HASH on STORE');
	$ui->p('Downloads an object, and shows the containing record. The stores are tried in the order they are indicated, until one succeeds. If the object is not found, or not a valid Condensation object, the program quits with exit code 1.');
	$ui->space;
	$ui->line('The following object properties can be displayed:');
	$ui->line('  cds show hash of …');
	$ui->line('  cds show size of …');
	$ui->line('  cds show bytes of …');
	$ui->line('  cds show hashes of …');
	$ui->line('  cds show data of …');
	$ui->line('  cds show record …');
	$ui->space;
	$ui->p('Multiple properties may be combined with "and", e.g.:');
	$ui->line('  cds show size and hashes and record of …');
	$ui->space;
	$ui->command('cds show record HASH');
	$ui->p('As above, but uses the selected store.');
	$ui->space;
	$ui->command('cds show record FILE');
	$ui->p('As above, but loads the object from FILE rather than from an object store.');
	$ui->space;
	$ui->command('… decrypted with AESKEY');
	$ui->p('Decrypts the object after retrieval.');
	$ui->space;
	$ui->command('cds show object …');
	$ui->p('A shortcut for "cds show hashes and data of …".');
	$ui->space;
	$ui->title('Related commands');
	$ui->line('cds get OBJECT [decrypted with AESKEY]');
	$ui->line('cds save [data of] OBJECT [decrypted with AESKEY] as FILE');
	$ui->line('cds open envelope OBJECT [on STORE] [using KEYPAIR]');
	$ui->line('cds show document OBJECT [on STORE]');
	$ui->space;
}

sub show($o, $cmd) {
	$cmd->collect($o);

	# Get and decrypt the object
	$o:object = defined $o:file ? $o->loadObjectFromFile : $o->loadObjectFromStore;
	return if ! $o:object;
	$o:object = $o:object->crypt($o:aesKey) if defined $o:aesKey;

	# Show the desired information
	$o->showHash if $o:showHash;
	$o->showSize if $o:showSize;
	$o->showBytes if $o:showBytes;
	$o->showHashes if $o:showHashes;
	$o->showData if $o:showData;
	$o->showRecord if $o:showRecord;
	$o:ui->space;
}

sub loadObjectFromFile($o) {
	my $bytes = CDS->readBytesFromFile($o:file) // return $o:ui->error('Unable to read "', $o:file, '".');
	return CDS::Object->fromBytes($bytes) // return $o:ui->error('"', $o:file, '" does not contain a valid Condensation object.');
}

sub loadObjectFromStore($o) {
	return $o:actor->uiGetObject($o:hash, $o:store, $o:actor->preferredKeyPairToken);
}

sub loadCommand($o) {
	my $decryption = defined $o:aesKey ? ' decrypted with '.unpack('H*', $o:aesKey) : '';
	return $o:file.$decryption if defined $o:file;
	return $o:hash->hex.' on '.$o:actor->storeReference($o:store).$decryption;
}

sub showHash($o) {
	$o:ui->space;
	$o:ui->title('Object hash');
	$o:ui->line($o:object->calculateHash->hex);
}

sub showSize($o) {
	$o:ui->space;
	$o:ui->title('Object size');
	$o:ui->line($o:ui->niceFileSize(length $o:object->bytes), ' total (', length $o:object->bytes, ' bytes)');
	$o:ui->line($o:object->hashesCount, ' hashes (', length $o:object->header, ' bytes)');
	$o:ui->line($o:ui->niceFileSize(length $o:object->data), ' data (', length $o:object->data, ' bytes)');
}

sub showBytes($o) {
	$o:ui->space;
	my $bytes = $o:object->bytes;
	$o:ui->title('Object bytes (', $o:ui->niceFileSize(length $bytes), ')');
	return if ! length $bytes;

	my $hexDump = $o:ui->hexDump($bytes);
	my $dataStart = $hexDump->styleHashList(0);
	my $end = $dataStart ? $hexDump->styleRecord($dataStart) : 0;
	$hexDump->changeStyle({at => $end, style => $hexDump->reset});
	$hexDump->display;
}

sub showHashes($o) {
	$o:ui->space;
	my $hashesCount = $o:object->hashesCount;
	$o:ui->title($hashesCount == 1 ? '1 hash' : $hashesCount.' hashes');
	my $count = 0;
	for my $hash ($o:object->hashes) {
		$o:ui->line($o:ui->violet(unpack('H4', pack('S>', $count))), '  ', $hash->hex);
		$count += 1;
	}
}

sub showData($o) {
	$o:ui->space;
	my $data = $o:object->data;
	$o:ui->title('Data (', $o:ui->niceFileSize(length $data), ')');
	return if ! length $data;

	my $hexDump = $o:ui->hexDump($data);
	my $end = $hexDump->styleRecord(0);
	$hexDump->changeStyle({at => $end, style => $hexDump->reset});
	$hexDump->display;
}

sub showRecord($o) {
	# Title
	$o:ui->space;
	$o:ui->title('Data interpreted as record');

	# Empty object (empty record)
	return $o:ui->line($o:ui->gray('(empty record)')) if ! length $o:object->data;

	# Record
	my $record = CDS::Record->new;
	my $reader = CDS::RecordReader->new($o:object);
	$reader->readChildren($record);
	if ($reader->hasError) {
		$o:ui->pRed('This is not a record.');
		$o:ui->space;
		$o:ui->p('You may use one of the following commands to check out the content:');
		$o:ui->line($o:ui->gold('  cds show object ', $o->loadCommand));
		$o:ui->line($o:ui->gold('  cds show data of ', $o->loadCommand));
		$o:ui->line($o:ui->gold('  cds save data of ', $o->loadCommand, ' as FILENAME'));
		return;
	}

	$o:ui->recordChildren($record, $o:store ? $o:actor->blueStoreReference($o:store) : '');

	# Trailer
	my $trailer = $reader->trailer;
	if (length $trailer) {
		$o:ui->space;
		$o:ui->pRed('This is probably not a record, because ', length $trailer, ' bytes remain behind the record. Use "cds show data of …" to investigate the raw object content. If this object is encrypted, provide the decryption key using "… and decrypted with KEY".');
		$o:ui->space;
	}
}
