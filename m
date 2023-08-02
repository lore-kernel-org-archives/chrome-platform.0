Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6DDD2E8
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 19:00:02 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso94637b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 02 Aug 2023 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691002802; x=1691607602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzF9x4t5qGNLhu/caA8ssAI8B7SC1PGMy1H+sJ5/tR0=;
        b=UjVU6zLjjcnePdMgvLoU5oHUsC1vMaN3+dTJcRIT2HLNrnz+MM1nDh48TFjdqULqgR
         yqRS8cYadZLqaqb9Y63RI5c+tuaupHOnPwU2BxjHlVO50KS99Q/e5pOKE8Ibe68G4Um6
         MMS6BbFv2WC+HIRrQSqpS6QBgfEdLuuy/G8VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691002802; x=1691607602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzF9x4t5qGNLhu/caA8ssAI8B7SC1PGMy1H+sJ5/tR0=;
        b=DO+xAPxQry878Tim5idJofgcNk1b8ZyLxQgNhmI0I4n3ZAHdhkAwdl9fsvrT8FoWbl
         4V00T0mOsp11wN46EXu/u3dfn0j59xYYxnoRjbQ8gcZzPdFlWpcVTXsiR21O3gosrUW1
         m3EVrlspxOuH2MGlZK+t2gsjj8oLkd4OjqBbP6/kvssffHFUjW6gY1gW09BIBJYy6he+
         Df45EDw9tf6W5XODRigtOpQid/fn+nzK1vrogRRomBp/w4+lkzTNQV3+oVBdtH6PsCN3
         fpC5RvOfQjbkmPvnljbDNlyqaiX6jv3Wx56LSPndripZx3xnSrj6KXQkHX27eS6diCrn
         lebQ==
X-Gm-Message-State: ABy/qLZ5fGdD1GCyk+tIkwRe+NL5E7Amrk5uBj3k2fcfXE5ZV3Mfsp79
	FY36ehGDeNZQ2WEwvd0U9tDqJE1H/WhQonDgwS8=
X-Google-Smtp-Source: APBJJlG1RdDE8qG10/f3Vem+LkZHzZvgaNDSVnGeKulwmcSQBAemOCE3RNGSU1Wy4m+GzgOWemKb/g==
X-Received: by 2002:a05:6a00:18a5:b0:686:24e1:d12e with SMTP id x37-20020a056a0018a500b0068624e1d12emr20180035pfh.30.1691002802425;
        Wed, 02 Aug 2023 12:00:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c176:7aff:3481:d21c])
        by smtp.gmail.com with ESMTPSA id m2-20020aa79002000000b006825003a276sm11407283pfo.42.2023.08.02.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:00:01 -0700 (PDT)
Date: Wed, 2 Aug 2023 11:59:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMqnr10+XxNjF7n/@google.com>
References: <20230726073127.2969387-1-tzungbi@kernel.org>
 <ZMh82LaanrHh+33t@google.com>
 <ZMl+2+mr7AiIx7e1@google.com>
 <ZMoqpq375u2R2H8m@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMoqpq375u2R2H8m@google.com>

On Wed, Aug 02, 2023 at 06:06:30PM +0800, Tzung-Bi Shih wrote:
> On Tue, Aug 01, 2023 at 02:53:31PM -0700, Brian Norris wrote:
> > NB: the docs (Documentation/ABI/testing/sysfs-driver-chromeos-acpi)
> > suggest that some attributes (like VDAT) are indeed binary, and so we
> > should probably maintain or fix that.
> 
> No.  Unless we also want to change userland program in [2].

I mean, I think you need to do one of those two -- either keep this
(maintain) as "binary", or update (fix) the doc to describe the hex dump
instead.

i.e., I think this piece of
Documentation/ABI/testing/sysfs-driver-chromeos-acpi is now wrong:

What:           /sys/bus/platform/devices/GGL0001:*/VDAT
Date:           May 2022
KernelVersion:  5.19
Description:
                Returns the verified boot data block shared between the
                firmware verification step and the kernel verification step
                (binary).

But, the userland program already doesn't know how to handle the
upstream driver. So it'd be possible to change both at the same time.

Anyway, hex-encoded is fine with me too; we just need to get the docs to
match.

Regards,
Brian
