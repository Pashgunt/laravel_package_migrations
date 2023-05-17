<?php

namespace Migrations\Parser\App\PARSER\Contracts;

use Closure;
use Migrations\Parser\App\PARSER\Services\MementoProcessFile;

interface ProcessPiplineInterface
{
    public function process(array $data, Closure $next): array;
    public function save(): MementoInterface;
    public function restore(MementoProcessFile $mementoProcess): void;
}
