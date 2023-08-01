Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C667263C0
	for <chrome-platform@lists.linux.dev>; Tue,  1 Aug 2023 21:53:34 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4598797a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 01 Aug 2023 14:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690926813; x=1691531613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rdDMc4tR+7xGYZtfLl3Mpe9aV28Ij3xKY0595hWf0Ic=;
        b=YAsroC3olYTzm5GQ+mDVIYdgbgXQUXSeEUlZ5NCmn6C5Wv4bU/bMI4jRgOABEcn46/
         26CiEUsfhtMw3lj1O8sFBluy3hk4f2zXwcqmC7JO+mcrz+1IzsEGoKFlNh7xETHOvFEd
         RDfPgvoMqQ2IEjmAa6M0N8kHU6cMO+x+1hQ4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690926813; x=1691531613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdDMc4tR+7xGYZtfLl3Mpe9aV28Ij3xKY0595hWf0Ic=;
        b=DVg4jH+OEw6Mq0E15xLAsm5c/NVoLd5DOGAn75RcqjsgwOqsGv0SPZS+PrhjpV0aao
         kFl4O5qYoxPQLF/4bcDPEYAhGnKflZlNJ+geFXlMAQmO0tMqkJz+TdaVbfA+u49+LwSB
         gEx2Gn73SRH60Hx3qlajAsIZ7ZgcvTUPYza3D27g9yHhMCpxdyes+TqRp7rh0tA4cPzp
         5AioqNlNAyJOZjXzcXaMR9iJUU5KSSrz/2CfPGkDaN2xAVYOpvMsUnDo9QHpQSPitXO6
         0LXbYWnE9X3lb+NNXZEj7ydWNv3I0SyRuO/BVE2tV16uJGSITsBGVVN/T7j4RSn6e60k
         eEDg==
X-Gm-Message-State: ABy/qLYktsCeJZncsYF8BTxMkJ6oTQwYNdihwJdVNKAQiNgWfzq6jTIY
	e+R2HvhL1UfDNe0MzJPZryg/I8Ch0G6wCAz2Ie0=
X-Google-Smtp-Source: APBJJlGDnxOanYrietusKzJDu4We/4WEL5fm00B9XLRYCB1U3wcIP8N76c63/S3JqNqfYqC3nK6cNQ==
X-Received: by 2002:a17:902:eccf:b0:1b5:694:b1a9 with SMTP id a15-20020a170902eccf00b001b50694b1a9mr17461211plh.32.1690926813539;
        Tue, 01 Aug 2023 14:53:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1c1f:af3f:7a1e:7fc2])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902ea9300b001bba669a7eesm10915439plb.52.2023.08.01.14.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 14:53:33 -0700 (PDT)
Date: Tue, 1 Aug 2023 14:53:31 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMl+2+mr7AiIx7e1@google.com>
References: <20230726073127.2969387-1-tzungbi@kernel.org>
 <ZMh82LaanrHh+33t@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMh82LaanrHh+33t@google.com>

On Tue, Aug 01, 2023 at 11:32:40AM +0800, Tzung-Bi Shih wrote:
> On Wed, Jul 26, 2023 at 03:31:27PM +0800, Tzung-Bi Shih wrote:
> > `element->buffer.pointer` should be binary blob.  `%s` doesn't work perfect
> > for them.
> > 
> > Print hex string for ACPI_TYPE_BUFFER.
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> Curious about does this patch make sense to folks on the mailing list?

Since you asked.... (sorry if the questions are dumb; I'm not extremely
familiar with this one)

Are there any ABI concerns here? As in, did this perhaps work for some
use cases that will be broken now by this change in format? If not, it
would be nice to note your thought process on that. [1]

Also, is it possible to use some standard formatting, like
hex_dump_to_buffer()?

Or, would it make more sense to make these into binary attributes
(struct bin_attribute)?

NB: the docs (Documentation/ABI/testing/sysfs-driver-chromeos-acpi)
suggest that some attributes (like VDAT) are indeed binary, and so we
should probably maintain or fix that.

Brian

[1] My guess: no real user space actually uses this driver yet, since
ChromiumOS still has its own downstream variant on its active kernels?
