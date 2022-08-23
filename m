Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E844323E
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 17:52:52 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id l5so10965692qtv.4
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aVY44zUJCCDQ7+jE7lahWZfCJK6yRD2rgu0a7TJeScs=;
        b=QPGtAhAC9IPHz4YOehFybYLcoAHltpwZeYqPHM0Aef8Vz+ZD765VxYLhu6SP3ggXE+
         sgo+WBPoZVhj0Xuo4AvreWK6N77yPPSw2kS68dqP1X+JgbttRrQ7XcTBVuZ29H2ajhqb
         uZ7q4rSRSjBMa+uuLEWw224WUWt1jLNhjcC4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aVY44zUJCCDQ7+jE7lahWZfCJK6yRD2rgu0a7TJeScs=;
        b=i6yM+LhpTFR2nwCjIHPNL4VNIx6mkbAKVKcFrjhFGeZ6uJ4xx3jLk9KLTUnUNs7uyS
         BWqCtKlfApArtR0x2cgA2hXfy42FzgIvlstrJSskx35FLK80YDjMxHVjnTF8xDyqzhGu
         dryIqy/Q0+oJT3GDGbJy5MHg4P8QZmeQ4vEkUvO6jeJgjreKsu6bq9NvzVuckgM6/20d
         pNRmSfKS9gqoiG8wMjPCWWhQiADrMStw5lOi/FbI45tPAc/T09YYM0z8AT2BNVLOLsSv
         Zm2pCHdj8WxsJEmWfV9tYSGN2GIAyNks3linJn+4Jqr2mzhe9GUwW4BzlUBPEWsSLYpO
         d4pQ==
X-Gm-Message-State: ACgBeo0kWBkWHO1BokRUe36iCOpv9b7+ugg2RCBADRJ9jno7qMlWoL8U
	8E2uH5UpcC0fFf5j6PagM7UzJ+7g6KRFxIgb+Nf0Mw==
X-Google-Smtp-Source: AA6agR5k2ANBaD6tQI8kPLr5fMj3MFS9ARNHhCcTviM5G2mWb7zBc16KvcPvRdNRxlf/qtdj8rA/YTXLchgXYZpx/Cw=
X-Received: by 2002:a05:622a:15d6:b0:344:6a92:d8ca with SMTP id
 d22-20020a05622a15d600b003446a92d8camr20589533qty.540.1661277171274; Tue, 23
 Aug 2022 10:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-4-pmalani@chromium.org> <YwRa/QxA/RRtxU3P@google.com> <YwSNCFt48Q9Eo02I@kuha.fi.intel.com>
In-Reply-To: <YwSNCFt48Q9Eo02I@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 23 Aug 2022 10:52:39 -0700
Message-ID: <CACeCKae8YYQUk0dKKbuq-S-3D4=rPFHyjwgK7b55q_T=u9QjLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Stash port driver info
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the reviews folks.

On Tue, Aug 23, 2022 at 1:17 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Aug 23, 2022 at 04:43:41AM +0000, Tzung-Bi Shih wrote:
> > On Fri, Aug 19, 2022 at 07:08:04PM +0000, Prashant Malani wrote:
> > > Stash port number and a pointer to the driver-specific struct in the
> > > local Type-C port struct.
> > >
> > > These can be useful to the port driver to figure out how to communicate
> > > with the ChromeOS EC when an altmode driver related callback is invoked
> > > from the Type-C class code.
> >
> > The patch looks good to me.  But I would suggest to send it in later series
> > that uses the driver-specific struct (e.g. in altmode driver related callbacks)
> > to make the usage clear.
>
> I agree.

Ok. I will resend this along with the alt mode series.

BR,

-Prashant
