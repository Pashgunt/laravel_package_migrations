<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("oauth_clients", function (Blueprint $table) {
               $table->id("id");
               $table->unsignedBigInteger("user_id");
               $table->string("name", 255);
               $table->string("secret", 100);
               $table->string("provider", 255);
               $table->text("redirect");
               $table->tinyInteger("personal_access_client", 1);
               $table->tinyInteger("password_client", 1);
               $table->tinyInteger("revoked", 1);
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('oauth_clients');
    }
};
