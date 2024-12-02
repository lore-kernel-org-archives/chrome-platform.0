Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15B20898B
	for <chrome-platform@lists.linux.dev>; Mon,  2 Dec 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153710; cv=none; b=WPWLsDbO4b1++X98Qd03B302sV6x5xxeVrJ7wIx1HmxAhCcyp2lBm3DwOQiievBHdtBrN9EVfEn4b1XOHMW0U352SAcM7VlC7uON/7JAyC3ShHwbnSlIjmY5sfI3NcZbR87LJHWGkd0Pn4v20Vda6mQvy13+6/lLBNpKWlmBkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153710; c=relaxed/simple;
	bh=wET5iUvdjdRBR+mAqN2BzzvlWPpGl4352cNBjiC+WwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMTqO53RW6Z3vH03v93FD9mh0SEA0jDJQsryVJYbeERqYW8JMVADTnCsU+y8eWNhXECyRd6Pdio8mQV8Hw/d3gszG8T1N1BXACe2GVai23DcCAwve6WuPj+pJDyfCxRGTB7BXFFh5BdGeOolZDHtaWIF2rcmgioHSJ/2y4BV+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kn7/2HFs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kn7/2HFs"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffd796ba0aso41724901fa.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Dec 2024 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733153706; x=1733758506; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTNygzoOaggPdN5UwohHlIdEXipF1yLKnsPhAigGFzk=;
        b=kn7/2HFsmg9UIJGcS1iikE1ydV9JISmXDC4HYwI5fXDdR8VMwDkfH74d2etVyaAnLm
         MImhzvcSWnp8cp2K4QjAJUVJSlChF+yOGVrnGeGCTWvZwzp4+ZGx4ymqiclJnALfjmyr
         8YPIovEo+jksJop459qQQzy9xzttzN2eub6qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153706; x=1733758506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTNygzoOaggPdN5UwohHlIdEXipF1yLKnsPhAigGFzk=;
        b=Ypla4d8ZcVGZnnysnmHQ2K8fND2AMIm71AzEPpiM2etJIN/P0eoIHkBrrpbETnxzFj
         Jl90bQaCiAebSonjc94nMPkRAZEVulVlxWBu8v9AgsJ3Ul2ROKFZFCYHbGXG1CfLIJt7
         sUFir87iHsYii8KT297LaDJ+0/2TgO/MvHOEOkViulj3AKRI3qnL5vQr3puB2vGpl0ML
         d/JyVuOZD7jw0kdf/BVoTLPoidSg83zjH7PeQ0cllsj+kr7T30IyiE3bQ2sLPR2DQ4Mv
         wnVvmtfTXIUlbT/XpHUCfQ2nKHBudoppTc2WpBcrNikOESKuVyB8QibGzCOkp00HyCwz
         hmJw==
X-Forwarded-Encrypted: i=1; AJvYcCXkWQ7oDtGVqnWnoW1IKlIqD/ryM3YHxYegTW+oDXVL2952X5gvc9L0C6Hzp28ZIK8VN0SHnZjw5NTGbYsJmPk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpJ5F/n4kiVo3SqFpWuQtELxQJl3ifHD4ppSPy0mASYhTSz97a
	dV1wkJSI0GRRm5/xduzYYP81Uxd17+wZG45dRnSGNx4M4HY1g17ih0Rd0XIL+OWNXmCkssfMpnG
	Wex1klP3j+NJi5aoCzYwUYFmfU+0NHEX76VQ=
X-Gm-Gg: ASbGncs5LkdwQfQZD9Qqw3HMyHKlg401/Ja1YnkXx1bXljC3Vw8tS8zgpUfc2PdF67l
	4xW/t3hh0dxGrAqCD/Ks1U7wSlIKsBGXc7B7yuUS/m1ddOOvkd/Wu3xrIitY=
X-Google-Smtp-Source: AGHT+IFho6OCDoejpt8T1j/LPhusZpc57QvNJuFpM3qw8J9ipJ/39T9tYhrHkiywnuBcmRC7AjGn+JFtfWTKEXFxY1E=
X-Received: by 2002:a05:651c:19aa:b0:2ff:afef:3ec5 with SMTP id
 38308e7fff4ca-2ffd60de30bmr118782021fa.27.1733153706401; Mon, 02 Dec 2024
 07:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128232035.1525978-1-ukaszb@chromium.org> <20241128232035.1525978-4-ukaszb@chromium.org>
 <Z02-57oN7h_E1VQ1@kuha.fi.intel.com>
In-Reply-To: <Z02-57oN7h_E1VQ1@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 2 Dec 2024 16:34:55 +0100
Message-ID: <CALwA+NbCupB-N8j1-a96EJPimd1VpLfH8tAYKbE1j+RC_J0q4g@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] usb: typec: cros_ec_ucsi: Recover from write timeouts
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 3:06=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> On Thu, Nov 28, 2024 at 11:20:35PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > In a suspend-resume edge case, the OPM is timing out in ucsi_resume and
> > the PPM is getting stuck waiting for a command complete ack. Add a writ=
e
> > timeout recovery task that will get us out of this state.
>
> Sorry, I did not realise this before, but this is in practice a fix
> (or workaround) to the driver that you just introduced in the previous
> patch. Please merge it into that.
>

Hi Heikki,

Yes I will merge it. I deliberately sent it as a separate commit for
review so that
it would be easier to see the changes.

> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 88 ++++++++++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index c588d9a57643..6daf61e7e62a 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/container_of.h>
> >  #include <linux/dev_printk.h>
> > +#include <linux/jiffies.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> > @@ -29,6 +30,9 @@
> >   */
> >  #define WRITE_TMO_MS         5000
> >
> > +/* Number of times to attempt recovery from a write timeout before giv=
ing up. */
> > +#define WRITE_TMO_CTR_MAX    5
> > +
> >  struct cros_ucsi_data {
> >       struct device *dev;
> >       struct ucsi *ucsi;
> > @@ -36,6 +40,8 @@ struct cros_ucsi_data {
> >       struct cros_ec_device *ec;
> >       struct notifier_block nb;
> >       struct work_struct work;
> > +     struct delayed_work write_tmo;
> > +     int tmo_counter;
> >
> >       struct completion complete;
> >       unsigned long flags;
> > @@ -99,12 +105,43 @@ static int cros_ucsi_async_control(struct ucsi *uc=
si, u64 cmd)
> >       return 0;
> >  }
> >
> > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     int ret;
> > +
> > +     ret =3D ucsi_sync_control_common(ucsi, cmd);
> > +     if (ret)
> > +             goto out;
> > +
> > +     /* Successful write. Cancel any pending recovery work. */
> > +     cancel_delayed_work_sync(&udata->write_tmo);
> > +
> > +     return 0;
> > +out:
>
> This label looks a bit unnecessary to me. How about a switch statement?
>

Good point. I will rework this part of the code to use switch.

Thanks,
=C5=81ukasz

>         ret =3D ucsi_sync_control_common(ucsi, cmd);
>         switch (ret) {
>         case -EBUSY:
>         case -ETIMEDOUT:
>                 cancel_delayed_work_sync(&udata->write_tmo);
>                 schedule_delayed_work(&udata->write_tmo, msecs_to_jiffies=
(WRITE_TMO_MS));
>                 break;
>         case 0:
>                 cancel_delayed_work_sync(&udata->write_tmo);
>                 break;
>         }
>
>         return ret;
>
> > +     /* EC may return -EBUSY if CCI.busy is set. Convert this to a tim=
eout.
> > +      */
> > +     if (ret =3D=3D -EBUSY)
> > +             ret =3D -ETIMEDOUT;
> > +
> > +     /* Schedule recovery attempt when we timeout or tried to send a c=
ommand
> > +      * while still busy.
> > +      */
> > +     if (ret =3D=3D -ETIMEDOUT) {
> > +             cancel_delayed_work_sync(&udata->write_tmo);
> > +             schedule_delayed_work(&udata->write_tmo,
> > +                                   msecs_to_jiffies(WRITE_TMO_MS));
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  struct ucsi_operations cros_ucsi_ops =3D {
> >       .read_version =3D cros_ucsi_read_version,
> >       .read_cci =3D cros_ucsi_read_cci,
> >       .read_message_in =3D cros_ucsi_read_message_in,
> >       .async_control =3D cros_ucsi_async_control,
> > -     .sync_control =3D ucsi_sync_control_common,
> > +     .sync_control =3D cros_ucsi_sync_control,
> >  };
> >
> >  static void cros_ucsi_work(struct work_struct *work)
> > @@ -118,6 +155,54 @@ static void cros_ucsi_work(struct work_struct *wor=
k)
> >       ucsi_notify_common(udata->ucsi, cci);
> >  }
> >
> > +static void cros_ucsi_write_timeout(struct work_struct *work)
> > +{
> > +     struct cros_ucsi_data *udata =3D
> > +             container_of(work, struct cros_ucsi_data, write_tmo.work)=
;
> > +     u32 cci;
> > +     u64 cmd;
> > +
> > +     if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
> > +             dev_err(udata->dev,
> > +                     "Reading CCI failed; no write timeout recovery po=
ssible.");
> > +             return;
> > +     }
> > +
> > +     if (cci & UCSI_CCI_BUSY) {
> > +             udata->tmo_counter++;
> > +
> > +             if (udata->tmo_counter <=3D WRITE_TMO_CTR_MAX)
> > +                     schedule_delayed_work(&udata->write_tmo,
> > +                                           msecs_to_jiffies(WRITE_TMO_=
MS));
> > +             else
> > +                     dev_err(udata->dev,
> > +                             "PPM unresponsive - too many write timeou=
ts.");
> > +
> > +             return;
> > +     }
> > +
> > +     /* No longer busy means we can reset our timeout counter. */
> > +     udata->tmo_counter =3D 0;
> > +
> > +     /* Need to ack previous command which may have timed out. */
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE) {
> > +             cmd =3D UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
> > +             cros_ucsi_async_control(udata->ucsi, &cmd);
> > +
> > +             /* Check again after a few seconds that the system has
> > +              * recovered to make sure our async write above was succe=
ssful.
> > +              */
> > +             schedule_delayed_work(&udata->write_tmo,
> > +                                   msecs_to_jiffies(WRITE_TMO_MS));
> > +             return;
> > +     }
> > +
> > +     /* We recovered from a previous timeout. Treat this as a recovery=
 from
> > +      * suspend and call resume.
> > +      */
> > +     ucsi_resume(udata->ucsi);
> > +}
> > +
> >  static int cros_ucsi_event(struct notifier_block *nb,
> >                          unsigned long host_event, void *_notify)
> >  {
> > @@ -162,6 +247,7 @@ static int cros_ucsi_probe(struct platform_device *=
pdev)
> >       platform_set_drvdata(pdev, udata);
> >
> >       INIT_WORK(&udata->work, cros_ucsi_work);
> > +     INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
> >       init_completion(&udata->complete);
> >
> >       udata->ucsi =3D ucsi_create(dev, &cros_ucsi_ops);
>
> thanks,
>
> --
> heikki
