Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67909157A48
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299461; cv=none; b=gRTDXxHmPFYgNIkaLiC+8xGLm42BsxoG86BPrx0NJnv5jnrAeqKhd5GzlZCzRmjJiw1uymT2omLsPBZ6GxuqXgE8jBOGoipDofCMx8gJ/bKe1bYdnlXZ8ikN9CcggO/Qo0hZhyoIMAEFOrRD+xAX2tH3vW1PqNWuEduVsPjdAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299461; c=relaxed/simple;
	bh=ENI533Wvk9fW22NzjUB/wng+S3KXlrAb+HlIIZDYhbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooOkQVWtLecPIsXQEKH6cjszQLIbVaXAOqIfE7sxbB9zPQVRz2lckCSM1ULouKaeHRswA62ppEqgIoJsXxaGHjt5NE0pciG9YUaNcXriZSzsTlYiP6YeD6946NO4b1qTTCq/ziz0abx/lYlsEnH2Uo/SWojTr/xreol1IqB40xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPaddFX0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPaddFX0"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365a9574b6so484232e87.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299457; x=1727904257; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSSQUfbDC1+51k8Yn6Wcx1enae2/noyB/PVtp31Onqc=;
        b=sPaddFX01Gg9QHXHMGCTzaDS5s1yU442X3b4N3DNvYv1Z2edDmSSFgrvCvJUx+6CLX
         4oZRlBOy6pCmHb2S9uHwdll8TVBujVIH3tboc3Hw8Okfh0SnJkAPNovHmW1quKvXTsAx
         xfbOJCfCCSAQcXKI7EuVhIrs1gdLXyZEP3lPPgppicsFEsdhLUeSIauNTO89fT1yNdb9
         1V+FHQYLPuWiBD/GDsMczy+eNGLCrzsTQeQpum+bWvb5mKauNH3KAMf+oTloQK6NIhMS
         uj5jbFkrxZyimTRtzMCrct++JXyT46QV3jcQxX2Ndn98KqKVgIQMRRUHcNxjXxBlb7TI
         m7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299457; x=1727904257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSSQUfbDC1+51k8Yn6Wcx1enae2/noyB/PVtp31Onqc=;
        b=V7supilWWDxiEZSq3Mbnjd+JwwdycLnGMjts9Yj373VD/NrgLpiAKWzc3I2Ng511f2
         6IEdxqvhqqOo6B5ZHXz8HxRocaHEoWYStZbLnMHHKySPGlJrSzBdF+gAvmhxlqZPOq+1
         UV40tnI1mDE4yfkrUFjHFapjPFd+sodfgv0QA0Mp7SxOeUaIUnIY+eQpZQkrFWYXLLKJ
         LChe4fnv4VNTPUSVwE5Tjz6/cASU2h4Ni33dxdbahK5g2CZXZgHq0cebD9ZQdxih4BH9
         I/y+ayWbnDEkXvAKx8mvbuuzFxGpDkMs5HFCjwe763Gi5HtTqd/6KiFG/hOqvoFKwtZq
         m/UA==
X-Forwarded-Encrypted: i=1; AJvYcCX2I3Bx4kmoWinQgTr6VGv796bTs66WJGTRfWFjO97QPLbAxK8qiR1vO1hpqbUu/4eeEozYNbakIjOvGbUSQWU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzleUnn/aYHn013E/eqWnC8aWIkJmC4dXCdTKogcZ6ZmV1RHVXW
	mUo0tSn2RGvB0rdxNikbXOGr7bnNGnNtZ8JGp4npRv9wzlInQGtqEF7EbKcBqbE=
X-Google-Smtp-Source: AGHT+IH3/LP3ilxbDfmA6pTL0SoDzTXi6TCiYTvAxyyZOZ/hEkaOkOMnHWfB/zS+ShC1mBJZo4SXyg==
X-Received: by 2002:a05:6512:e84:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-5387755ced1mr3677792e87.39.1727299457320;
        Wed, 25 Sep 2024 14:24:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53896ea4ce9sm60186e87.293.2024.09.25.14.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:24:15 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
Message-ID: <25dcuu7bli47etvyijpi4winx4t42jwjq5ld2de3vmzkucic5j@h3wejwqyo7p2>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
 <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
 <CANFp7mVir-XEuVBd+kbQq0+5Si0CBo8TNxcdNpG6X+PDR-J1Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mVir-XEuVBd+kbQq0+5Si0CBo8TNxcdNpG6X+PDR-J1Zw@mail.gmail.com>

On Wed, Sep 25, 2024 at 10:39:00AM GMT, Abhishek Pandit-Subedi wrote:
> On Wed, Sep 25, 2024 at 10:03 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 09:25:09AM GMT, Abhishek Pandit-Subedi wrote:
> > > Altmodes with cros_ec are either automatically entered by the EC or
> > > entered by typecd in userspace so we should not auto enter from the
> > > kernel.
> >
> > This makes policy decision for the whole platform. Consider somebody
> > running normal Linux distro on chromebooks. Can this be configured by
> > the userspace itself?
> 
> This is just the default for when the driver registers. You will then
> find that there is now a sysfs entry for auto_enter that you can
> control from userspace to allow you to auto-enter the mode on partner
> attach (which you could probably write a udev rule for).

I think, a usual policy is to handle everything automatically, unless
userspace configures it in a different way. Otherwise it might be really
surprising to users, if the kernel expects an action from the
non-existing userspace agent.

> I still need to send a follow-up for how to handle auto-enter when
> there are multiple modes available on the partner that are all
> enabled. This first patch series is mostly about supporting existing
> use-case for ChromeOS.

Doesn't EC decide that, which AltMode to select?

> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > ---
> > >
> > >  drivers/platform/chrome/cros_ec_typec.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > > index ec13d84d11b8..e06a0f2712ce 100644
> > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > @@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
> > >       desc.svid = USB_TYPEC_DP_SID;
> > >       desc.mode = USB_TYPEC_DP_MODE;
> > >       desc.vdo = DP_PORT_VDO;
> > > +     desc.no_auto_enter = true;
> > >       amode = cros_typec_register_displayport(port, &desc,
> > >                                               typec->ap_driven_altmode);
> > >       if (IS_ERR(amode))
> > > @@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
> > >               memset(&desc, 0, sizeof(desc));
> > >               desc.svid = USB_TYPEC_TBT_SID;
> > >               desc.mode = TYPEC_ANY_MODE;
> > > +             desc.no_auto_enter = true;
> > >               amode = cros_typec_register_thunderbolt(port, &desc);
> > >               if (IS_ERR(amode))
> > >                       return PTR_ERR(amode);
> > > --
> > > 2.46.0.792.g87dc391469-goog
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
