<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("users", function (Blueprint $table) {
               $table->id("id");
               $table->string("name", 255);
               $table->string("email", 255);
               $table->timestamp("email_verified_at");
               $table->string("password", 255);
               $table->string("remember_token", 100);
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
               $table->string("two_factor_code", 255);
               $table->dateTime("two_factor_expires_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('users');
    }
};
