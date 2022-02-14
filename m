Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38C627
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 01:48:47 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id z16so4742771pfh.3
        for <chrome-platform@lists.linux.dev>; Sun, 13 Feb 2022 17:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GZi2a4c2Jxa4BMeSk+Zmf4PjSVvBkZeBTKVe1UpGOyc=;
        b=Oixljf7Y4Rc4hsV5RQnXgzw6w/IPLzae3N5/ib4Q+arZrU6I4tr29e7MUBwWpyslVW
         mrZ8F56F0mypAXenhZLboqC/gqKVaf2XoOuGrRIlx2wIcNNuu87Xq0QMy8xNOAPxHYU3
         KxRbiYdLSvBBvYMWzxS2Wt9pLOs/lL8ksgbp5auTSHoDvnO3hHhzHfFyyV1pR/PwoZhI
         PBE+eQH26THiWKJd0G+ARAkwSvPX5OcM41WRIWfvHpGOEQDu90BcbWbw2CH1rUUTtgpA
         GnY0zZF92NaVWA7zNReuNM7yC6ycEqrvGWlr4HsStogYnzMEqk2BAhglA93LozJmXaGM
         H+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GZi2a4c2Jxa4BMeSk+Zmf4PjSVvBkZeBTKVe1UpGOyc=;
        b=6jxNYtPdJn+z7cWyx3J94uBdvGavWKso1x8uqZ7XEWwaMSgiIObLvdM0tEsq1TmD+5
         vAGeFfCADMpNZk8GjrBiJLB5rmk3hCuX8PxbNsk3YY4WCCBTsfC0BRfW6rezZ4y8azpW
         XmEqB64vxB5wZuPlkFiIg0rq0lUnUjwPD7Bm9gsW+pnfugr7QwxdwY03WjzDZ2AIpqG2
         6N+Bj8UFOn5RnvdCkRBCPOATG5EwkYiVp+idD1cByLjWXkl3K0J5uyl010TT+2m/IvZi
         ngfH2fwcd7+9jjmBPc/g4epLPYMR2RLYamMnvhwj7V4I/IbT+gD9IN0f5nWiesf9MD8S
         Mj3Q==
X-Gm-Message-State: AOAM530qA/NgPFEy2zguBYHIWxrG80tuzwcb4HzNCkMzZykEVO8wtnl2
	jKwDV7bv9yyp0YkALu/HPPG3vw==
X-Google-Smtp-Source: ABdhPJyVbgZq7AFilr/qbRUu5X7MgQByixiKeGtzVaE4n3F7z1+ittFaB3Nw8616WEg7V+oHaXMoFw==
X-Received: by 2002:a63:c156:: with SMTP id p22mr9819599pgi.215.1644803326515;
        Sun, 13 Feb 2022 17:48:46 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:78cf:362f:f9d8:32f])
        by smtp.gmail.com with ESMTPSA id a9sm24379552pgb.56.2022.02.13.17.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 17:48:46 -0800 (PST)
Date: Mon, 14 Feb 2022 09:48:43 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Sami Kyostila <skyostil@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, bleung@chromium.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, evanbenn@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 1/1] platform/chrome: add a driver for HPS
Message-ID: <Ygm0+3S/Q+JHzzxB@google.com>
References: <20220207013613.1150783-1-skyostil@chromium.org>
 <20220207013613.1150783-2-skyostil@chromium.org>
 <YgSli/6HuZ+i+2gb@google.com>
 <CAPuLczuizJkwHsKo+W3MEjX7T_fHXApVyou3BuMH_aAQfyk1Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPuLczuizJkwHsKo+W3MEjX7T_fHXApVyou3BuMH_aAQfyk1Vg@mail.gmail.com>

Hi,

Left some follow-up questions before going for the v4.  Please also cc the
following patches to <chrome-platform@lists.linux.dev> in case we would
overlook them from LKML.

On Fri, Feb 11, 2022 at 08:08:45PM +1100, Sami Kyostila wrote:
> ( to 10. helmik. 2022 klo 16.41 Tzung-Bi Shih (tzungbi@google.com) kirjoitti:
> >
> > On Mon, Feb 07, 2022 at 12:36:13PM +1100, Sami Kyöstilä wrote:
> > > When loaded, the driver exports the sensor to userspace through a
> > > character device. This device only supports power management, i.e.,
> > > communication with the sensor must be done through regular I2C
> > > transmissions from userspace.
> > >
> > > Power management is implemented by enabling the respective power GPIO
> > > while at least one userspace process holds an open fd on the character
> > > device. By default, the device is powered down if there are no active
> > > clients.
> > >
> > > Note that the driver makes no effort to preserve the state of the sensor
> > > between power down and power up events. Userspace is responsible for
> > > reinitializing any needed state once power has been restored.
> >
> > It's weird.  If most of the thing is done by userspace programs, couldn't it
> > set the power GPIO via userspace interface (e.g. [1]) too?
> 
> I agree that's a little unusual, but there are some good reasons for
> this to be in the kernel. First, it lets us turn HPS off during system
> suspend -- which I'm not sure how you'd do from userspace. Second, it
> avoids the need to give write access to the entire GPIO chip to the
> hpsd userspace daemon. We just need a single line, while the
> controller in this case has a total of 360 gpios. Finally, HPS also
> has an interrupt line, and we're planning to let it wake up the host,
> which I also believe needs to be done in the kernel.

What prevents it from implementing the I2C communication in kernel?

Did you investigate if there are any existing frameworks for HPS
(e.g. drivers/iio/)?  I am wondering if kernel already has some abstract code
for HPS.

Only found one via:
$ git grep 'human presence sensor'
drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h: [...]

> > > +static void hps_unload(void *drv_data)
> > > +{
> > > +     struct hps_drvdata *hps = drv_data;
> > > +
> > > +     hps_set_power(hps, true);
> >
> > Why does it need to set to true when device removing?
> 
> By default, HPS is powered on when the system starts and before the
> driver is loaded. We want to restore it to that default state here.
> This is needed for example for automated testing, where we can unbind
> the driver to make sure HPS stays powered.

Echo to the idea of previous comment: does kernel have any frameworks for HPS?
"HPS is powered on when the system starts" sounds like a chip specific
implementation.

> > > +static int hps_suspend(struct device *dev)
> > > +{
> > > +     struct i2c_client *client = to_i2c_client(dev);
> > > +     struct hps_drvdata *hps = i2c_get_clientdata(client);
> > > +
> > > +     hps_set_power(hps, false);
> > > +     return 0;
> > > +}
> > > +
> > > +static int hps_resume(struct device *dev)
> > > +{
> > > +     struct i2c_client *client = to_i2c_client(dev);
> > > +     struct hps_drvdata *hps = i2c_get_clientdata(client);
> > > +
> > > +     hps_set_power(hps, true);
> > > +     return 0;
> > > +}
> >
> > Does it need to save the old state before suspending?  Instead of turning on
> > the power after every resumes.
> 
> No, the runtime pm system makes sure suspend and resume are only
> called when needed. For example, if someone has an open reference to
> the device when the system goes to sleep, suspend and resume are
> called appropriately. If HPS was already suspended, then neither
> entrypoint gets called when going to sleep or waking up.

It uses UNIVERSAL_DEV_PM_OPS() which also sets for .suspend() and .resume().
OTOH, the documentation suggests it has deprecated (see include/linux/pm.h).
