<?php

namespace Migrations\Parser\App\PARSER\Contracts;

interface RulesInterface
{
    public function checkCreateStart(string $raw): bool;
    public function checkCreateEnd(string $raw): bool;
    public function checkDropStart(string $raw): bool;
    public function checkDropEnd(string $raw): bool;
    public function checkInsertStart(string $raw): bool;
    public function checkInsertEnd(string $raw): bool;
    public function checkComment(string $raw): bool;
}
