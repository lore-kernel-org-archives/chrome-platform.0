Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB94A00
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 18:19:09 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id va17so21360071ejb.0
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KohUrBmDurVBooPdiYyB7gOaJD1TmlyoWIhvQZBEuEU=;
        b=dKsPRBVLByu28QFGbHxsNaJ7Oj051WWN9eXj89MWzHIHTee+qkO/AiGhoh4UnteV9m
         FvcSG+2Na8HGyqJzyUbqmkMrqkfIt4BMIduf9jIkPY36PfouJKys6TiGIIoFiyBIqM1h
         c3bP2WDQzbMgDACvRkHF+0+7EjVNcpmkI8vHLqOQLT6Ljmo6ZktaFzu34V6rMpptHDg7
         LLtCeK96hmm7UksmkE4SzjBeHMTbzR0p6pjXU6bF5nhSHFOqSeLpYpzRdeG2jszMM/le
         VtDIGEygSedRachxWG5X3QyC12xdEGnjBDP/D4vkTBJwUGxJLyyiWw7cXDjuDzqyGEZZ
         KcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KohUrBmDurVBooPdiYyB7gOaJD1TmlyoWIhvQZBEuEU=;
        b=0TX+fvUco4/tzXUbCYHUv1pueYYlj3YIn7SxNwaQ03eHG0TdsLNtW+JOWnCh0oZZmJ
         R49vOTlr7+NI5nj9+qgt5GYr5TRuLXl5fgha8dSxA3sQbQAE/D1YjfFfnis8gduECGfl
         FspCdQZ+wanppjCe4OwC3VDc9paWFXZTuEmd5aihgwFNjVV2R6//fg81ptiS9YKsww6T
         kTkCuitCIF0oRQ58gU/zdBOR3CL0adW4GCUOdFizBb6ZPUiCP7rRfavdJutWY5qAFbJV
         gEcu15vldpu2N2Jl/fbkp4UdJLuPJQuP8LSgXVoV8X8iRUSMl/3yCdiznc8WXVCCq1YG
         MX8A==
X-Gm-Message-State: AJIora99An885UqAtwegyr3MYfkwjUNrIygsSScXcrPiL5ZtvTn3/fUy
	J4K550/j8Ip3NdzLKiRmQ1cgg8MJ1dVuu0DoRIKEsg==
X-Google-Smtp-Source: AGRyM1smYL3KTATzHxWiw4hPtQUF27x/M3YaAXOvvUqkVlsIeJKQeuxcfy/93Llvw3gIJjHFe1eZ8Eufp7P04LLNirQ=
X-Received: by 2002:a17:907:6d12:b0:72b:6e70:8c7d with SMTP id
 sa18-20020a1709076d1200b0072b6e708c7dmr4925612ejc.23.1657736347623; Wed, 13
 Jul 2022 11:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-9-tzungbi@kernel.org>
In-Reply-To: <20220628024913.1755292-9-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 13 Jul 2022 11:18:56 -0700
Message-ID: <CABXOdTec8MtFU2N60fXy-z=cKUXkO4ZtCCRHPXjZUuX3JJ2NOw@mail.gmail.com>
Subject: Re: [RESEND PATCH 08/11] platform/chrome: cros_ec_proto: change Kunit
 expectation for EC errors
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_wait_until_complete() checks `msg->result` for
> EC_CMD_GET_COMMS_STATUS.  However, it doesn't return standard error codes
> like most of others.
>
> Change the Kunit test expectation to align them.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index fbb872040711..2a6b099fbfd9 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -1927,7 +1927,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_return_error(struct kunit *t
>         }
>
>         ret = cros_ec_cmd_xfer(ec_dev, &msg);
> -       KUNIT_EXPECT_EQ(test, ret, 0);
> +       KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
>
>         KUNIT_EXPECT_EQ(test, msg.result, EC_RES_INVALID_COMMAND);
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
