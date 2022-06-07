Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054E28FB
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:41:14 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w27so23258478edl.7
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dwnhigmvnRJAWniZxkZTwdL7idmJbhuznJCxT4duogM=;
        b=s1DQjAv6qXl0hjUYws377ZimKgpBHnwEOIPXXtPeGjzeMCuYSfiJ1/vhk+HYXU4j5g
         jc/Noch4FtxgaKKDStvXy5lOSksYaTtykY9qDVpKqmIqSZLqJIJ6zLePVsxass1SS+Ko
         fMJq5aMeOHn5v0vw5+XlUBvM6Fm860fCkG1zOfTn42fTNfknw3yoQvOTiMZDsd5viL2E
         nfqHYB9qk9dFAsdglnZQmLlEtCwlJeoxRyJWAzklgMIvVyyxH3PmowLGUtwwigOJolLu
         vPuxV30jyyHegR6y3VgRieohSHsOoiPGpTWY+xiYpTQ5qHpr6jycHITPMsvhEMSLP9HB
         G57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dwnhigmvnRJAWniZxkZTwdL7idmJbhuznJCxT4duogM=;
        b=13Q1ULoU0n1fCFPukCgAMfdhe7xGb7puTmpEkamBQW0QLlFl1J3ZkQLnGAl+q17W/M
         9XxjINkSB4nkiTNgY0YSViGIK4sjHzyirwbvB1pjo3l3DQbNRE7mMN9MABEUVxvpBboW
         VygVeP212fFVfLVTe+IAEQAw/VC4rC0HXIxyIhctnd6B6OSIzgNkcoh1D0kNKIPLJwgC
         /9l8xFo0vYsuh2CGcMCA8l48Dg0yxvHCMgmBUtSDAK7CU0DQqTB3ao3D0daIBF31FSVI
         UcPxd50Ko+EfQgvFomjQ8gusFhD2ocTTnLPKlb436Ny8Pd+jmzTGBnliqbd5pxj1CHP0
         Z4nA==
X-Gm-Message-State: AOAM530LOsuN//J5KjFHTyskYedwNq8Y20dC4a4Nc9n8sBN4MelDVi9A
	lcLiBqJwVl+TczOwAw3qPAiQUv/jusZIw5oEefwzdA==
X-Google-Smtp-Source: ABdhPJwzCV36560W30SwE+CyUNPG3eSwhUADDDlBcfeTz+nYPBEKOgPFOv4vCLbZs9JC5LY2HeOzNYMQBp1W3E4dMVY=
X-Received: by 2002:a05:6402:3490:b0:42f:b592:f364 with SMTP id
 v16-20020a056402349000b0042fb592f364mr22184364edc.66.1654612872873; Tue, 07
 Jun 2022 07:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-3-tzungbi@kernel.org>
 <CABXOdTdT0EtVoO6JmD0RdsmGvAXF3ERRwJATO01dU8+CtO7ofg@mail.gmail.com> <Yp6h08cYtUgat1cQ@google.com>
In-Reply-To: <Yp6h08cYtUgat1cQ@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 07:41:01 -0700
Message-ID: <CABXOdTd+J9oX68RMJBe9hAJShMHm=vf73Zx2pq10YDbGpAUaow@mail.gmail.com>
Subject: Re: [PATCH 02/13] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_query_all()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 5:54 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Jun 06, 2022 at 08:18:41AM -0700, Guenter Roeck wrote:
> > On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > +static void cros_ec_proto_test_query_all_pretest(struct kunit *test)
> > > +{
> > > +       struct cros_ec_proto_test_priv *priv = test->priv;
> > > +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> > > +
> > > +       /*
> > > +        * cros_ec_query_all() will free din and dout and allocate them again to fit the usage by
> > > +        * calling devm_kfree() and devm_kzalloc().  Set them to NULL as they aren't managed by
> > > +        * ec_dev->dev.
> > > +        */
> > > +       ec_dev->din = NULL;
> > > +       ec_dev->dout = NULL;
> > > +}
> > > +
> > > +static void cros_ec_proto_test_query_all_normal(struct kunit *test)
> > > +{
> [...]
> > > +       cros_ec_proto_test_query_all_pretest(test);
> > > +       ret = cros_ec_query_all(ec_dev);
> >
> > Wouldn't it be better to implement a post_test function and have it
> > call devm_kfree() if it is really necessary to release ->din and
> > ->dout here ?
> >
> > Either case, I am not convinced that clearing / releasing din and dout
> > is really needed. The device pointer should not change, after all, and
> > either the next call to cros_ec_query_all() will release the pointers,
> > or unloading the driver will do it.
>
> The `din` and `dout` are not managed by `ec_dev->dev` but statically
> initializing in cros_ec_proto_test_init()(see below).
>

Good point. Still I think it would be better to have a _post function
and clear ->din and ->dout after the call instead of clearing it
before the next call.

Thanks,
Guenter

> cros_ec_proto_test_query_all_pretest() sets them to NULL to get rid of the
> following warning (as devres_destroy() in devm_kfree() returns -ENOENT):
> WARNING: CPU: 0 PID: 27 at drivers/base/devres.c:1058 devm_kfree
>
> Oops, I just realized qemu still generated yet another warning:
> Device '(null)' does not have a release() function, it is broken and ...
> Will fix it in next version.
>
> [...]
> > >  static int cros_ec_proto_test_init(struct kunit *test)
> > >  {
> > >         struct cros_ec_proto_test_priv *priv;
> > > @@ -188,24 +902,48 @@ static int cros_ec_proto_test_init(struct kunit *test)
> > >         ec_dev->din = (u8 *)priv->din;
> > >         ec_dev->din_size = ARRAY_SIZE(priv->din);
> > >         ec_dev->proto_version = EC_HOST_REQUEST_VERSION;
> > > +       ec_dev->dev = kunit_kzalloc(test, sizeof(*ec_dev->dev), GFP_KERNEL);
> > > +       if (!ec_dev->dev)
> > > +               return -ENOMEM;
> > > +       device_initialize(ec_dev->dev);
> > > +       ec_dev->cmd_xfer = cros_kunit_ec_xfer_mock;
> > > +       ec_dev->pkt_xfer = cros_kunit_ec_xfer_mock;
> > >
> > >         priv->msg = (struct cros_ec_command *)priv->_msg;
> > >
> > > +       cros_kunit_mock_reset();
> > > +
> > >         return 0;
> > >  }
