Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664952F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 06:12:23 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id j2so47124790ybu.0
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 22:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OLS1qG2/31/qv95jBrunYz8W6LmWRIuON498ceRNCdU=;
        b=Q/LnvOvx7/obZ/wdiMqJNB/3sgZQ9TkVmhG8RJcQVbM/RAJKOyeUZsThaytxw5LwRG
         F0V7L/LF99sYMeIGsXtarFL53NlT+j40Yr4IR7/XK32DqxUEfzvupmSYQI5knbiAtdiE
         hbR1SIKE7mb3cRGGQMy4PnupF1nHo56/yPtzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OLS1qG2/31/qv95jBrunYz8W6LmWRIuON498ceRNCdU=;
        b=65TqMJvxCEr3QJjXSMMCuwPjAOn3dsl1d3Uo27exhMLRIfPCoL1ao+k9AmyvAd04/w
         gL41LkEspa9d6way7esgeA7sWKTsFvVccQGt16Adi8YgntAf8bIFO8HNn8lDht7/nEVK
         vuMKhok/C+rByCYEeLAtFCvPeakm9+oIWGfijjdOAG4vsw3GlyX7JJYSYJ914eDWJCJX
         Cu3qUe4pRP9YjRzuAG3bpY+YM14LVUetS06NNGkA4BS+BVaM2Z4UnIQvlYFSHyRtbuhE
         3Z+oAl5UJgtDGlM6ocjnnuqQr/ma5hzrPKpm8h6A5j+HSzEQpN4TNc24fIQAvHZ1X0zX
         NWRA==
X-Gm-Message-State: AOAM532PGtkQTUAzRdXogGfNidBcfA937KxNGGxVLZEvxXMGQXRGiPjO
	+p2Z9n3SIWRxeOaULcpCVPGCIePCyAZI+uJicAvLzg==
X-Google-Smtp-Source: ABdhPJxOPkZl//mWeFNC4iG9V3hjqFnSJwuUjnu2Vdy5KQg2ABwkunMvuTuvMx6CptgF3dGHlnD19raQKa+8V7xy478=
X-Received: by 2002:a25:be43:: with SMTP id d3mr3156548ybm.454.1644300742373;
 Mon, 07 Feb 2022 22:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-4-pmalani@chromium.org> <YgIBv2SQdwXm7RLt@google.com>
In-Reply-To: <YgIBv2SQdwXm7RLt@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 7 Feb 2022 22:12:10 -0800
Message-ID: <CACeCKaezRNgsqrq3QJ1ViHjYScFrjpC-kCaYmE8kOXCcW9MRrw@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at
 start of port update
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

On Mon, Feb 7, 2022 at 9:38 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Feb 07, 2022 at 09:40:28PM +0000, Prashant Malani wrote:
> > There are situations where the mux state reported by the Embedded
> > Controller (EC), might lag the partner "connected" state. So, the mux
> > state might still suggest that a partner is connected, while the PD
> > "connected" state, being in Try.SNK (for example) suggests that the
> > partner is disconnected.
> >
> > In such a scenario, we will end up sending a disconnect command to the
> > mux driver, followed by a connect command, since the mux is configured
> > later. Avoid this by configuring the mux before
> > registering/disconnecting a partner.
>
> I failed to understand the description.  It looks like some protocol details.
> Could you provide some brief explanation in the commit message?

I'm not sure how else I can better elaborate on this in the commit message than
as currently stated.
Since the EC is an independent controller, the mux state *can* lag the
"connected" state.
So, as described in the commit message, when a disconnect happens, we could have
a disconnect (since PD_CTRL contains the "connected state") followed
by a configure_mux
with the mux state still suggesting a connected device (the drivers
which implement the
mux/switch controls can misconstrue the old mux state) which results
in a connect. This
patch eliminates that.

>
> On a related note, followed up the example scenario, which one of the
> understanding is the most applicable:
> 1) The disconnect followed by a connect is suboptimal.  The patch cleans it.
> 2) The disconnect followed by a connect is a bug.  The patch fixes it.
This one (number 2)

>
> > @@ -965,6 +965,11 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* Update the switches if they exist, according to requested state */
> > +     ret = cros_typec_configure_mux(typec, port_num, &resp);
> > +     if (ret)
> > +             dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
>
> It used the fact that the function returns `ret` at the end.  After the move,
> the block is no longer the last thing before function returns.
>
> Does it make more sense to return earlier if cros_typec_configure_mux() fails?
> Does the rest of code need to be executed even if cros_typec_configure_mux()
> fails?

Yes, it should still be executed (we still need to update the port
state). That is why the return is eliminated.

>
> > @@ -980,11 +985,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
> >       if (typec->typec_cmd_supported)
> >               cros_typec_handle_status(typec, port_num);
> >
> > -     /* Update the switches if they exist, according to requested state */
> > -     ret = cros_typec_configure_mux(typec, port_num, &resp);
> > -     if (ret)
> > -             dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> > -
> >       return ret;
>
> If the function decides to return earlier, it can be `return 0;`.
Sure, I can change this in the next version
