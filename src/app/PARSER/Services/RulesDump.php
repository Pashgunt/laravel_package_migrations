<?php

namespace Migrations\Parser\App\PARSER\Services;

use Migrations\Parser\App\PARSER\Contracts\RulesInterface;

class RulesDump implements RulesInterface
{
    public function checkCreateStart(string $raw): bool
    {
        return !!preg_match('/CREATE(.|\s+)TABLE/', $raw);
    }
    public function checkCreateEnd(string $raw): bool
    {
        return !!preg_match('/(?<=(\s|.|\)))(ENGINE|CHARSET|COLLATE).+;/', $raw);
    }
    public function checkDropStart(string $raw): bool
    {
        return true;
    }
    public function checkDropEnd(string $raw): bool
    {
        return true;
    }
    public function checkInsertStart(string $raw): bool
    {
        return true;
    }
    public function checkInsertEnd(string $raw): bool
    {
        return true;
    }
    public function checkComment(string $raw): bool
    {
        return true;
    }
}
