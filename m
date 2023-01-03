Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E988F57
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 18:55:15 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id o127so34132181yba.5
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 10:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60s8/1qZh8c3Dcc7cFNt5aFCnbeZvcI/OzWL4Nko71Y=;
        b=k9ZpERD1UMFfi2rU0SikxaJDEAr8JGbJfXrT4J9IjbaIjADkl4Okn3a6EOsrxKQyQe
         DglGIRI40X5UYm6H/lbdIFPWg4N+zdJ0Vyxm+DnuRF86yKbL+/1VzdU29dRsCJD6j2d1
         tGQxyMAntY7J3iHylSisYIggi81xn3DKNtvv8AmJ5tasSb6GZt8z+zgTnfcdljsb9ZWI
         q9AJHSOPW7DEgbL9xiK4G+psUmX4pe5c1n8j3I4ssjaQZhkeZRjxLOGgR2YlqcA8cdOd
         wrA9/dW/kdTTz/GFb9WHsPa6WDQf9Cay/Q1qiwTsyuHEOxY0GpelRmCY5UEhy9BmuyUg
         MZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60s8/1qZh8c3Dcc7cFNt5aFCnbeZvcI/OzWL4Nko71Y=;
        b=FtfL6IUjhVNnOmMPa5ardZG+KaBzlf2TS3bAGAxBaQ7VRkAfnAel534e1yZ71i7mnM
         ji65AMBD2FqPUXZVbg8a2pHugleFBlyI08CJOXSzN0U1xHAuGSuhFyrf/mZ368wumA0I
         mDWSHRUCHrMGerILLaYTpcXYXPJeKP3htdewC1GaFdOWsUFyyVQ2OCfT8wFImWr0II/s
         vDR/7qyJU/+h0r2tiMJuXfBAeHQ8A1rKtGUAnhfeqjQ1NCkQeoQ5QQS81mH6vDPf2UKA
         pZdMFb4wgoOiu0hMJYysuHqeW9V+/LcMRkm9gzm+73Itka1bgQD6HypLVELpdI94yTAb
         KlqQ==
X-Gm-Message-State: AFqh2kqUzlMsHVLOUNxIBf/R3owf81QQAvvsrYxMO4GJTLlkywUEhKdA
	9IwxJK2pUszbK2nj9gmZXrqVR0iDNo5CijFTIeih7Q==
X-Google-Smtp-Source: AMrXdXtgyCEJSEXyde46jTTMw3EoQhBhcFBBlVHOZgyzJ+zkrL2pbU00+jbMUdYJt0RyCiKJeLVXzJa2tKpEsz3hRd0=
X-Received: by 2002:a05:6902:281:b0:73b:eea3:accb with SMTP id
 v1-20020a056902028100b0073beea3accbmr5005526ybh.327.1672772114084; Tue, 03
 Jan 2023 10:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230103145023.40055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230103145023.40055-1-andriy.shevchenko@linux.intel.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 3 Jan 2023 10:55:03 -0800
Message-ID: <CABXOdTdLFbi+-wUk1ohX+5bs01b0WX-MRSH9tUWD316vucpdmw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] platform/chrome: cros_ec_proto: Use asm intead of asm-generic
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 6:50 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is no point to specify asm-generic for the unaligned.h.
> Drop the 'generic' suffix.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Subject: s/intead/instead/

otherwise

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index c6a83df91ae1..08c58d031593 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -5,7 +5,8 @@
>
>  #include <kunit/test.h>
>
> -#include <asm-generic/unaligned.h>
> +#include <asm/unaligned.h>
> +
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>
> --
> 2.35.1
>
