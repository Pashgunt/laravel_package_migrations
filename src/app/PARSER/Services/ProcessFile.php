<?php

namespace Migrations\Parser\App\PARSER\Services;

use Closure;
use Generator;
use Migrations\Parser\App\PARSER\Contracts\MementoInterface;
use Migrations\Parser\App\PARSER\Contracts\ProcessPiplineInterface;

class ProcessFile extends RulesDump implements ProcessPiplineInterface
{
    protected Generator $fileHandler;

    private string $state = '';

    public function __construct(string $source)
    {
        $this->fileHandler = (ReadFile::getInstance())->readTheFileAsync($source);
    }

    public function process($data, Closure $next): array
    {
        $caretakerProcess = CaretakerProcessFile::getInstance($this);
        $createList = [];
        $createStructure = "";
        $isAdd = false;
        foreach ($this->fileHandler as $fileRaw) {
            if ($this->checkCreateStart($fileRaw)) {
                $isAdd = true;
            }
            if ($isAdd) {
                $createStructure .= "\n $fileRaw";
            }
            if ($this->checkCreateEnd($fileRaw) && $isAdd) {
                $createList[] = trim($createStructure);
                $this->state = $createStructure;
                $caretakerProcess->backup();
                $createStructure = "";
                $isAdd = false;
            }
        }
        return $next($createList);
    }

    public function save(): MementoInterface
    {
        return new MementoProcessFile($this->state);
    }
    public function restore(MementoProcessFile $mementoProcess): void
    {
        $this->state = $mementoProcess->getState();
    }
}
