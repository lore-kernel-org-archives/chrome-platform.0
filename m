Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EAE323E
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 17:51:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id h21so10964822qta.3
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=UIzDP5vwti9FmU1AI9oaSSCd8EVdsxXrvtKhWPii6Ls=;
        b=n9EyyFTG/4qV8hBj/xZT7cxhDCcCzWUnXlR28oIo8BqRbO+yb4WdH3fOZBTkuSvL1W
         XThcrSdj/+NAkxDa8Uc2/svIiL8VWEik9zFt7182JEFTajKgOFWXVAE9EU03/VhoVTnX
         jrtysU+h9taVmG9fYTKKNqip/XsM03qFL9tLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UIzDP5vwti9FmU1AI9oaSSCd8EVdsxXrvtKhWPii6Ls=;
        b=yp+NY4+ZNB0DIZ5EHdv+HlbI6TbO2Tm9lKf9rIWySwb8ENe6NjtIO2nqJqn2DBYx2g
         mMCuUsf7Kjvcv1tviazIGiyTsOxIyfRzqPNY8xGe2eCODIcnv/uLmPTuRT+FqZP+LaGP
         T2TW+bXdSH42OrN99kHCFEszHzia5lk1xHkrRmt6JGjghTt5NbXlgtGEvlWWCGMI/yhJ
         9JsNDSj4uoHqS+TKtHSwouf2Gay+4sdRh3gOyW+b+atPKCCVVEOhrg1td+wbpuKIiN4u
         hemO+jXk1/1i3ZDsmYIj8yyt49Y8Lxng1/lJ8NPoaDg4+xACQu+5b+sMgCVGhF+SRRix
         tsxg==
X-Gm-Message-State: ACgBeo1KN5wXjLvD5S3An294tqd2i/aX8R+Duptvfkz3f6oFVHktO1jo
	IFtMKu/Kt0e5I9X0+OF1b3fRWI5lhM31haN6TEjWDg==
X-Google-Smtp-Source: AA6agR730EhiRgym3AI3/b6SGv53XnXR1qB8rLkxcwKm55lfnHnwCeRBZkbhjbDTZoObhYPD5IgkvjoUGi8OhYwlX64=
X-Received: by 2002:a05:622a:15d6:b0:344:6a92:d8ca with SMTP id
 d22-20020a05622a15d600b003446a92d8camr20584786qty.540.1661277070554; Tue, 23
 Aug 2022 10:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-5-pmalani@chromium.org> <YwRbCvOy8WXUEphH@google.com>
In-Reply-To: <YwRbCvOy8WXUEphH@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 23 Aug 2022 10:50:58 -0700
Message-ID: <CACeCKaduPJuBqwnLbaaEfvxiVrJ0qmVkcWsvbDarCJi0u8-TBw@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: cros_ec_typec: Use Type-C driver data
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Guenter Roeck <groeck@chromium.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

Thanks for reviewing the series.

On Mon, Aug 22, 2022 at 9:43 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 7daf4207c11e..e3f75440030d 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -379,6 +379,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >               ret = cros_typec_parse_port_props(cap, fwnode, dev);
> >               if (ret < 0)
> >                       goto unregister_ports;
> > +             cap->driver_data = cros_port;
>
> Same as previous patch.  I would suggest to send it in later series.  For
> example, I have no knowledge to judge if `cap` is a correct place to save
> the driver data.
>
> For example, I'm wondering: is the `cap` "the Type-C port's driver"?

The Type-C framework uses [1] the cap->driver_data while creating the
port device.

That said, sure, I can resend patch 3 and 4 when I upload the alt mode series.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/class.c#L2098
