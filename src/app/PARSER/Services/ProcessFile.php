<?php

namespace Migrations\Parser\App\PARSER\Services;

use Closure;
use Generator;

// TODO make precess file dependence at memory, perfomance and size 
class ProcessFile
{
    protected Generator $fileHandler;

    public function __construct(string $source)
    {
        $this->fileHandler = (ReadFile::getInstance())->readTheFileAsync($source);
    }

    public function process($data, Closure $next): array
    {
        foreach ($this->fileHandler as $fileRaw) {
            dd($fileRaw);
        }
        return $next($data);
    }
}
