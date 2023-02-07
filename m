Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C97468
	for <chrome-platform@lists.linux.dev>; Tue,  7 Feb 2023 18:02:56 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id u8so6336678ilq.13
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 10:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUQ+Q0O4InpaxQsTYmk72fYT5UIvjG/Pm2uUP+Phbwk=;
        b=JGHoYL40Z6fjjUrLtEJSGnhqJ5HXvZqZ45pUm+86mk1oyvSMIQ6hL2kSeRAqxRs686
         rMOxQaQhOIUbvArfmOgeHG/va2KZMhBxe88CJ/UDb5mK5zau+L4jSNjKHn/N4rrHR7sL
         xaT6BSBIOSA5nNoJ9b6EHgzgrFronLQpS8Pdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUQ+Q0O4InpaxQsTYmk72fYT5UIvjG/Pm2uUP+Phbwk=;
        b=Djd/gUwQppV5papH7GrM0mBmj0z9nd2bDpqQSPJRgWnSyQlJcBZXkjT11dnLcD1xcl
         9aKJnAxtUIxQ7Jdt5PYAbG/CjRsI5jamJE3KLOQZEVFQPtg6vN3pmAUCI7jR4u+DvXU2
         kKCmRcK2k4iqbMk9/ZUiZM6tB5kxUjcbRIWArLSFgCYmfhW//ho/IBiis2cA33+Wr/Ir
         EPbFXt7J8gWru2gVSBHjDWWOffv3xhIZUHafxM2//EeKniCJkKQOt6ZcLIzCa7mf/dqJ
         zdXoMESGRs6eZ3xzvOc34Ob25OW+4Oh6ElvrIiN0d+7gh/AzFKhL0Z+HYAavINm+HecW
         iypw==
X-Gm-Message-State: AO0yUKWYib+qy7qKpvS6Tt3c99YzX0/yiWuN9HH9Q65NKQQOfsVY5VV0
	z0tsd/ElbzwTbL+zv1c5LuDcCw==
X-Google-Smtp-Source: AK7set+Gs5sMZkpCEn+J2Ws04h4s1CYRJPvjEKEvzqVHSPh/cEtUPPOERE1fGdpKjwzCw+QLP5RncQ==
X-Received: by 2002:a05:6e02:1be8:b0:313:cd79:adcb with SMTP id y8-20020a056e021be800b00313cd79adcbmr4889037ilv.18.1675792975934;
        Tue, 07 Feb 2023 10:02:55 -0800 (PST)
Received: from chromium.org ([2a00:79e1:abc:1702:24:af62:de72:11ae])
        by smtp.gmail.com with ESMTPSA id q15-20020a02cf0f000000b0038a6ae38ceasm4647885jar.26.2023.02.07.10.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:02:55 -0800 (PST)
Date: Tue, 7 Feb 2023 11:02:52 -0700
From: Jack Rosenthal <jrosenth@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julius Werner <jwerner@chromium.org>,
	David Gow <davidgow@google.com>, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF
 Kconfig entries
Message-ID: <Y+KSTG92TtFK4PQm@chromium.org>
References: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>

On 2023-02-07 at 08:12 -0800, Douglas Anderson wrote:
> Ever since commit a28aad66da8b ("firmware: coreboot: Collapse platform
> drivers into bus core") the Kconfig entries GOOGLE_COREBOOT_TABLE_OF
> and GOOGLE_COREBOOT_TABLE_ACPI have been dead. They have no "help"
> text and thus aren't user choosable. They also aren't "select"ed by
> anything. They also control the compilation of no code.
> 
> Let's remove them.
> 
> Fixes: a28aad66da8b ("firmware: coreboot: Collapse platform drivers into bus core")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Jack Rosenthal <jrosenth@chromium.org>

> ---
> 
>  drivers/firmware/google/Kconfig | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
> index 9f190eab43ed..1bc7cbf2f65d 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/google/Kconfig
> @@ -44,14 +44,6 @@ config GOOGLE_COREBOOT_TABLE
>  	  device tree node /firmware/coreboot.
>  	  If unsure say N.
>  
> -config GOOGLE_COREBOOT_TABLE_ACPI
> -	tristate
> -	select GOOGLE_COREBOOT_TABLE
> -
> -config GOOGLE_COREBOOT_TABLE_OF
> -	tristate
> -	select GOOGLE_COREBOOT_TABLE
> -
>  config GOOGLE_MEMCONSOLE
>  	tristate
>  	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
> -- 
> 2.39.1.519.gcb327c4b5f-goog
> 
