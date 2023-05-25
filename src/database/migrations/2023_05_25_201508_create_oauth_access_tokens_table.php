<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("oauth_access_tokens", function (Blueprint $table) {
               $table->id("id");
               $table->unsignedBigInteger("user_id");
               $table->unsignedBigInteger("client_id");
               $table->string("name", 255);
               $table->text("scopes");
               $table->tinyInteger("revoked", 1);
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
               $table->dateTime("expires_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('oauth_access_tokens');
    }
};
