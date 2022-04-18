Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D93D61
	for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 23:41:42 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id z2so12035902oic.6
        for <chrome-platform@lists.linux.dev>; Mon, 18 Apr 2022 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nt67AC/fziRCHZ6C/VwJefCx0UfNr2G59yxCRKYFbPc=;
        b=coV+Xw+7+9GNFz3Ea8saZ3geP/wGaL/zYe71mwbODut3H5PVIvF7edk7idfkOXMCE4
         xN2byexgTFROxOQqvbsH6AZumeJWGwX+Tr5ZdpeBcVgiqq+AGpe2cV+viL4gKMMu+C4x
         jRE/fLiqKbMt7X1v9WHPdXbigUAfMEkFVzVF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nt67AC/fziRCHZ6C/VwJefCx0UfNr2G59yxCRKYFbPc=;
        b=ykJD8lAw2A0Vxjd/jXUUnLVwWYri6Y1Z+upqUuFm3X2GuEGWDhsNU6Z/0viW9NRztm
         sFETNhM0nsFA/LW1mbGP057uRWT1aJ+kI/Wi1Jd4kTTugL3IpnkFzB8+gCk6PJ2jr+8T
         wJ662iaoEZlK63iTepcZvtSXUNMkUpYfCoMbRhkwpFnY2+pTED52BAJm47idqVz3N/Kp
         744wgaEGzNwwtPgJhx1Z/356UaNQ5VeaQfkS8ZjjCGEAJBWCsHO0KyN5uTfKpsGvUR1V
         1/rpu7YwrYHn77v3bakEocNWvDYZ4zCHgFIRkHoJlVmghoznXyNXA4KL2v8afmHyG8qD
         f4sA==
X-Gm-Message-State: AOAM531gsBkVHBKSr76B3AS2KbYffuZykY7noSOZ2bZnqZkrJFfEGTM5
	1+J/KQ8+QOpusx09rqZUG68ACNL9DY4bBPmwb+skYw==
X-Google-Smtp-Source: ABdhPJx+f9x0ppm0dDZ5qHDJlsvPmDghYF7LzT5WM39003dq4Dcv4LSD35Q2evL841DhwiHe+0thBHgV/tswKkbDO78=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr6210643oif.63.1650325301373; Mon, 18
 Apr 2022 16:41:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 16:41:40 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yl307fUo09z2/M+w@chromium.org>
References: <20220415003253.1973106-1-swboyd@chromium.org> <20220415003253.1973106-2-swboyd@chromium.org>
 <Yl3vd4kfgwJXMs/w@chromium.org> <CAE-0n53N1k_b9vWJ84nBdm9sxpYV3o4-FLJQM1HGqEhQsdr19A@mail.gmail.com>
 <Yl3ykMvfCaQlQ7t9@chromium.org> <CAE-0n51PX1SgqiB5vgoOLunkrxiWxH2O=jCCM5gNL97O8Ltt4Q@mail.gmail.com>
 <Yl307fUo09z2/M+w@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Apr 2022 16:41:40 -0700
Message-ID: <CAE-0n5366tn28yBYXj+7gaKGWqx4pCTrQ-nPWiEvTOERS9R6uw@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/chrome: cros_ec_proto: Add peripheral
 charger count API
To: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Lee Jones <lee.jones@linaro.org>, 
	Daisuke Nojiri <dnojiri@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Quoting Prashant Malani (2022-04-18 16:31:57)
> On Apr 18 16:29, Stephen Boyd wrote:
> > Quoting Prashant Malani (2022-04-18 16:21:52)
> > > On Apr 18 16:16, Stephen Boyd wrote:
> > > >
> > > > Sure. I take it that I can drop this function entirely then?
> > >
> > > Yeah, if it's a simple response, should be fine.
> > >
> > > > BTW, why is
> > > > that function name the same as a struct name? It confuses my ctags.
> > >
> > > Yeahhh, didn't think about ctags... :/
> > > Topic for another series: probably can be renamed to cros_ec_cmd() (just to keep ctags happy) ?
> > >
> >
> > But then there'll be two cros_ec_cmd() because there's a
> > cros-ec-regulator. Fun! :)
>
> Ugh :S
>
> I think we can get rid of that one; it looks to be the same as this
> one :)
>
>
> I'll write up a cleanup series if it all looks OK.
>

Cool thanks! Would be useful to change those insize and outsize sizes to
size_t as well. Please Cc me on the series. I'll resend this series with
cros_ec_command() shortly.
