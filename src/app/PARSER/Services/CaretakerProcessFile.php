<?php

namespace Migrations\Parser\App\PARSER\Services;

class CaretakerProcessFile
{

    private static ?CaretakerProcessFile $_instance = null;

    private array $mementosProcessFile = [];

    private object $originator;

    final public static function getInstance(object $originator): CaretakerProcessFile
    {
        if (is_null(self::$_instance)) {
            self::$_instance = new self($originator);
        }

        return self::$_instance;
    }

    public function __construct(object $originator)
    {
        $this->originator = $originator;
    }

    public function backup(): void
    {
        $this->mementosProcessFile[] = $this->originator->save();
    }

    public function undo(): void
    {
        if (!count($this->mementosProcessFile)) {
            return;
        }
        $memento = array_pop($this->mementosProcessFile);

        try {
            $this->originator->restore($memento);
        } catch (\Exception $e) {
            $this->undo();
        }
    }

    public function getHistoryProcess()
    {
        return $this->mementosProcessFile;
    }
}
