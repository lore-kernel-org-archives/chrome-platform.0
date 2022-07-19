Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15D04C75
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 21:28:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id k30so21348944edk.8
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LgjyXYkBaNtEE8jtItSOwzOwdDtGTESi0Gq19caSxl8=;
        b=L0WbTsJOIt15Fy68WqNomCkAE1dCDGk+Wl2/jzpgamWz43DkfxaXTQaO31m8QWJXkB
         8aVagbfz2rEGZAN/TrrA+QGh4lHZL+r4LrLBXtaQCfc2MD6mBArwYXgkKdCpCDfEklWx
         xhkA2sSIp0V8N3mhSDmzmWBYWc6I7ZcIZzAN2ggitahiV+xrIC20Rgxo2z5QqxMLTm3x
         mNkLHVAGByMH9Ot1P9ku83zu+TZg4lpHAONYNMt34TjYAmIaBFM9n0Ss1TV1K3nUuOLr
         ahJjUrz96Jnq/K+QvXmyFyphx6Z+2gWY/BerZ6kjAfaW5jQY0304Gsx/VZ0rC7YgldzH
         qvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LgjyXYkBaNtEE8jtItSOwzOwdDtGTESi0Gq19caSxl8=;
        b=rw1roZXlWIfE+zjsABmpcLIaVJhq8mevoktMr3bHjVwUvRwSK8v6dYL10+x+uRFYAx
         Q/nJELnMS9Nmw9/ZVTmyRo3yNPIUad0FiznADGatbOGUWVS1crb38ue78UDe1TSEsgNc
         yS8a0uwDRaP4XXdB/jmgqx7bjXsHhsk7W0cWJZOdjkJD2BWS86U/LqDFkgYBlUiavR2S
         wldnGNPikaEI76MlUR8qt3t5sRDh2qnjq6L4EtN7tTeypG7B4U8MuOthXQHRJfPXSqsF
         DBGWIPXdOMC9yebwvqYwg6rTlz9v8boe2wk/bBtY32+5C/u2Vw0mX74vL7Fv5uukrEfR
         yMpg==
X-Gm-Message-State: AJIora+N3+TNZoq3KnUsQTcEicRs5tsZo263//ze/OX09pJzuRA71GWK
	yAPf6gzuORTxbMQs6fuxaD0kY5cJRKAmQDlz0Cajpg==
X-Google-Smtp-Source: AGRyM1umRAdSu38xVh0FNmoBhcbLpGnNzTvsXg6DMRfDKwCSMr+rPYTpWKkq4+ed5YerguJa26pzNMxc7uySoCAw/hY=
X-Received: by 2002:a05:6402:4252:b0:43a:9232:dafc with SMTP id
 g18-20020a056402425200b0043a9232dafcmr45670055edb.243.1658266081132; Tue, 19
 Jul 2022 14:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718050914.2267370-1-tzungbi@kernel.org> <20220718050914.2267370-2-tzungbi@kernel.org>
 <CABXOdTfYAGapjkPxRC4SbKMKEwCWmrF46aEDFWvsMBqaTuCzPA@mail.gmail.com> <YtYsXvi9WfdLFCiu@google.com>
In-Reply-To: <YtYsXvi9WfdLFCiu@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 19 Jul 2022 14:27:49 -0700
Message-ID: <CABXOdTf3zGf+pKFPeCXLeAX2t01Euf9enUUSuHq___Y+WFcWUA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] platform/chrome: cros_kunit_util: add default
 value for `msg->result`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 9:00 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Jul 18, 2022 at 06:35:42AM -0700, Guenter Roeck wrote:
> > On Sun, Jul 17, 2022 at 10:10 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > +int cros_kunit_ec_xfer_mock_default_result;
> > > +EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_result);
> >
> > Is this needed as a global variable and, if so, does it really have to
> > be exported ?
> >
> > >  int cros_kunit_ec_xfer_mock_default_ret;
> > >  EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_ret);
> >
> > Same here, really, only I didn't notice before.
>
> Global variables: I'm afraid yes.  They should be accessible to test cases
> (e.g. drivers/platform/chrome/cros_ec_proto_test.c).
>

Hmm, I don't see where that is used. Either case, even if the
variables are supposed to be used from cros_ec_proto_test.o, I don't
see why cros_ec_proto_test.o and cros_kunit_util.o need to be separate
modules. Can you combine them into a single module ? That would avoid
the exports.

Thanks,
Guenter

> Exported: I'm not sure if I fixed it in a proper way.  They were added for
> fixing https://lkml.org/lkml/2022/6/2/452.  When CONFIG_CROS_KUNIT=m and
> CONFIG_CROS_EC_PROTO_KUNIT_TEST=m, cros_ec_proto_test.c still needs to access
> them (in cros_kunit_util.c).
