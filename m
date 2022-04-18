Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA23D63
	for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 23:21:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c12so13568110plr.6
        for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 16:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wj9ktjp8539IBcyT0vIYeLD+G78WHjtfzUpEOICZKzM=;
        b=dffHjgxqGjuBcBO3tjLfh+jbi/wrxy4PJEkFZyRUNauUWHiW4oCvPHwvZYjl5cDvqb
         M60Qp7Zrk834tyQAN8D4tDhmCpEH/bIQSIpflT0jPvP4SHHpkUgnVZo8NNsD5XZjeigY
         huIWvCJI4M2w4cfIWpJT7Zb7BA2h4XtJuVXwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wj9ktjp8539IBcyT0vIYeLD+G78WHjtfzUpEOICZKzM=;
        b=NNzfNR4zSZh/uBZDZAoWoZwQJG6B6CYOyPfqMhoZ6SqYhtzpV5A9xovxoL6b/FWseX
         x++62Y8r/1kX1azuVctCCmCJk7DHcJEvA8yO3KxKfA1ayQoj0gOZm7Ztt8q/8LFa6tqs
         WmhIi3hL53CeezhlzBLyFjTBmJB9e2YKtdiOod6GpK6/22vmq/lx5tCXTVAk94Ct/3ny
         RahNM2bSfM7tUnA3+0EQDYRBCnZtbt6IRyiq+CwomZ8VNuTePyHsQ4hmVk1+m53gbDya
         L+55MdxIvxAYb+CSo6xJQnbVNXxQgxVjoMeRSPogqFDMBXo3Rll33kTzr3sm4kKCsc+p
         UOAA==
X-Gm-Message-State: AOAM533JqdfW6qEDUHhtA6SvpavSpTDNWHyTYyqP5hp3g+Y71u5sOiAV
	8hmsldg5yU24N1j1d69ZJbEQTg==
X-Google-Smtp-Source: ABdhPJzaZrHgZTRHQG9sU6PlJdSAjTGDIdi3eePNzKrdaL7pcgeYSIq0gxEeiiBpn09uDMbASCKt5Q==
X-Received: by 2002:a17:903:110c:b0:14a:f110:84e1 with SMTP id n12-20020a170903110c00b0014af11084e1mr13111551plh.7.1650324113692;
        Mon, 18 Apr 2022 16:21:53 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id a19-20020a62e213000000b005061dd378a1sm13457579pfi.35.2022.04.18.16.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 16:21:53 -0700 (PDT)
Date: Mon, 18 Apr 2022 23:21:52 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/3] platform/chrome: cros_ec_proto: Add peripheral
 charger count API
Message-ID: <Yl3ykMvfCaQlQ7t9@chromium.org>
References: <20220415003253.1973106-1-swboyd@chromium.org>
 <20220415003253.1973106-2-swboyd@chromium.org>
 <Yl3vd4kfgwJXMs/w@chromium.org>
 <CAE-0n53N1k_b9vWJ84nBdm9sxpYV3o4-FLJQM1HGqEhQsdr19A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53N1k_b9vWJ84nBdm9sxpYV3o4-FLJQM1HGqEhQsdr19A@mail.gmail.com>

On Apr 18 16:16, Stephen Boyd wrote:
> Quoting Prashant Malani (2022-04-18 16:08:39)
> > On Apr 14 17:32, Stephen Boyd wrote:
> > > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> > > index c4caf2e2de82..42269703ca6c 100644
> > > --- a/drivers/platform/chrome/cros_ec_proto.c
> > > +++ b/drivers/platform/chrome/cros_ec_proto.c
> > > @@ -832,6 +832,37 @@ bool cros_ec_check_features(struct cros_ec_dev *ec, int feature)
> > >  }
> > >  EXPORT_SYMBOL_GPL(cros_ec_check_features);
> > >
> > > +/**
> > > + * cros_ec_pchg_port_count() - Return the number of peripheral charger ports.
> > > + * @ec: EC device.
> > > + *
> > > + * Return: Number of peripheral charger ports, or 0 in case of error.
> > > + */
> > > +unsigned int cros_ec_pchg_port_count(struct cros_ec_dev *ec)
> > > +{
> > > +     struct cros_ec_command *msg;
> > > +     const struct ec_response_pchg_count *rsp;
> > > +     struct cros_ec_device *ec_dev = ec->ec_dev;
> > > +     int ret, count = 0;
> > > +
> > > +     msg = kzalloc(sizeof(*msg) + sizeof(*rsp), GFP_KERNEL);
> > > +     if (!msg)
> > > +             return 0;
> > > +
> > > +     msg->command = EC_CMD_PCHG_COUNT + ec->cmd_offset;
> > > +     msg->insize = sizeof(*rsp);
> > > +
> > > +     ret = cros_ec_cmd_xfer_status(ec_dev, msg);
> > > +     if (ret >= 0) {
> > > +             rsp = (const struct ec_response_pchg_count *)msg->data;
> > > +             count = rsp->port_count;
> > > +     }
> > > +     kfree(msg);
> >
> > Can we use the wrapper function cros_ec_command() [1] here, which does
> > the kzalloc and msg construction?
> >
> 
> Sure. I take it that I can drop this function entirely then?

Yeah, if it's a simple response, should be fine.

> BTW, why is
> that function name the same as a struct name? It confuses my ctags.

Yeahhh, didn't think about ctags... :/
Topic for another series: probably can be renamed to cros_ec_cmd() (just to keep ctags happy) ?

Best regards,

-Prashant
