<?php

namespace Migrations\Parser\App\Abstracts;

abstract class HelperGeneratorAbstract
{
    const PREFIX_FILE = "<?php \n";
    abstract function makeFilePath(string $path, string $tableName): string;
    abstract function generateFinalFile(string $tableName, array $tableColumns): string;
}
