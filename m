Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361887C
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 06:41:19 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l14so7827312wrw.2
        for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 22:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvKOgk3tDLWwb1NWyXvWAnYN0/RQ3NdysbGyQyA74cI=;
        b=oRbo7GGhWbJy2l8Rp7U1zQwZT6/x3xPfk/o5CkW3c8VNo4reSbqCG8/TCGHEesG5q7
         DDh2Ktjw+wy/gcb4aoTuTXgByV27VgTT8fC7JvOTWwcSndMkN3MCHzYGx687pJKdIUPn
         B4TbhU1quOtj4jCTQr96QRTcM00sN8Ixkifas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvKOgk3tDLWwb1NWyXvWAnYN0/RQ3NdysbGyQyA74cI=;
        b=UVOWW2Gy/tAfrZA5OCy+c8l6Q5FjB6CSksvM063ta8iDTfLFeOIsqXeIf76YWMPDpb
         82JkNiun3/guqbSGhxViMKdUuZa3g3R8T2zZcodl/Y+jMWmANSIbxRWxTJmKyXa8uTDK
         hHKQIIJvOqfV4jkwjwe91QUdnVwK3iHpAiD84oLFzo26YqKyuGaAZqDJaDFv1SjHxHj9
         53E2XRQ6IsOHeLgZIGBs8Qjzz6dFNaq1IbDypcqMsm6h5qJt2qMs7MEpBsSE+nR6DxIi
         QS+h0ucOwhwTT+kl3VE3j/JXshE21GV63so7jDQeO5wVF6vnEZPFqlE28MCKYOizxv81
         4pCQ==
X-Gm-Message-State: ANoB5pmQSQSRuN4iBPjyUAojMRRrAHTpgu8e9vg2gsCwsVaMXsUAiiSv
	eSh7fb4/YitVG7k5tQqO48jnCuK7oljQVDHk7uXvFw==
X-Google-Smtp-Source: AA0mqf6h3mCbrB9fesYTUW/Zh1uZgkTjjRfkkWD8QVK+210QpaWdfoKKF4ZKM2dDciAWSdEY40yuLUPeWnMYjyb04EM=
X-Received: by 2002:a5d:6a85:0:b0:241:bd77:f243 with SMTP id
 s5-20020a5d6a85000000b00241bd77f243mr1744786wru.393.1668753677438; Thu, 17
 Nov 2022 22:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210804213139.4139492-1-gwendal@chromium.org>
 <20210804213139.4139492-2-gwendal@chromium.org> <CAPUE2usQX_uQewpCYOs3SRUo7vDDMfg=n7idNvCgThDHMqTf7w@mail.gmail.com>
 <CAPUE2uuj1qde16QWHb=0+yMW3ERhXzV7ehGcViWCfij7ADeyWg@mail.gmail.com> <Y3bnYT6TXGXhkh/T@google.com>
In-Reply-To: <Y3bnYT6TXGXhkh/T@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Thu, 17 Nov 2022 22:41:06 -0800
Message-ID: <CAPUE2uuUn33yRMz77+XxZvK9bDzAA8u3SLBx=iDfAJc6WrUEEQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] platform/chrome: Poke kb_wake_angle attribute
 visibility when needed
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: dtor@chromium.org, jwerner@chromium.org, bleung@chromium.org, 
	enric.balletbo@collabora.com, groeck@chromium.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 17, 2022 at 6:01 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Wed, Nov 16, 2022 at 10:23:38AM -0800, Gwendal Grignou wrote:
> > [+chrome-platform@lists.linux.dev]
>
> Please also Cc to the mailing list if the patch gets chance to have
> next version.
>
> > On Mon, Nov 14, 2022 at 8:10 PM Gwendal Grignou <gwendal@chromium.org> wrote:
> [...]
> > > > Expose the attribute group to alter to close a potiential race between
> > > > cros-ec-sensorhub and cros-ec-sysfs (that creates the attribute group
> > > > on behalf of the class driver).
>
> I failed to realize the potential race.  Could you explain it a bit?
The decision to show or not an attribute is done at the attribute file
creation time, once. If the module cros_ec_sysfs is loaded before
cros_ec_sensorhub, the attribute kb_wake_angle will never be shown. If
it is loaded after, and there are 2 accelerometers, the is_visible()
function will return true and the attribute is shown.

This patch ensures the attribute is_visible() is run again after the
sensorhub driver is loaded.

Gwendal.
>
> > > > diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> > > > index 02599687770c5..c6dca260bbd5d 100644
> > > > --- a/include/linux/platform_data/cros_ec_proto.h
> > > > +++ b/include/linux/platform_data/cros_ec_proto.h
> > > > @@ -191,6 +191,7 @@ struct cros_ec_platform {
> > > >  /**
> > > >   * struct cros_ec_dev - ChromeOS EC device entry point.
> > > >   * @class_dev: Device structure used in sysfs.
> > > > + * @groups: sysfs attributes groups for this EC.
>
> The field name has extra "s".
