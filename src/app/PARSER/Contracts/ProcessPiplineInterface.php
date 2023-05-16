<?php

namespace Migrations\Parser\App\PARSER\Contracts;

use Migrations\Parser\App\PARSER\Services\MementoProcessFile;

interface ProcessPiplineInterface
{
    public function save(): MementoInterface;
    public function restore(MementoProcessFile $mementoProcess): void;
}
