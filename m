Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42C468A
	for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 18:13:32 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l5so11634038qtv.4
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=u1UVGt6PDJkRSWBfyxYzPJPgJUP53+mBBhKcycvTk2g=;
        b=DzjeZqnBEIOpRc0mqEBl5vCuzK/sA5YrAjEOSfzzRN+NHRw/jneFNPhOXOoa0/WAz8
         fapoH4MfjijFBac1DYoiBXKYAj6lbFwTnN5zLElx5Z71IBkIRItRnt+r6z/v1n0YsAwZ
         6BRIDW4+nXIcwSzg4MMBOBzBPVlsll5ktae+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=u1UVGt6PDJkRSWBfyxYzPJPgJUP53+mBBhKcycvTk2g=;
        b=YWG89s8LHGiKlZwHYxyARGSdkOhW2jvpjScjt9BRdwl/IKK7pbSoXBAQl/shl5RcGi
         hVnoQ2P8h+wWEHzy3W08thPm2rFzcqnQQAHIcPpUBUz51KxGUi6JwTjd5LioSQopdkPZ
         zqa2ADSbDnfSXDKHdNwbJIZjzIfeJOfPlH3xY6vv7k0e4ojd3at9Dp90SoLSoCaji/EW
         dqTM57Near73X/nEvyEy83rakqDc/tVOs744Uckp8lr3jwjS4h9LOKesuTuq1CTcT2A4
         s3OydW4CX8Pj27UG5M7b3y1LnXpTb1PcyLcPDO8xfDfZ6FFS0wU5ChEFIzkZvKNThxsg
         njiQ==
X-Gm-Message-State: ACgBeo0BJ9n9WZoQ3U2iMNCwzI27wcjdA3hwnMtttTvnVnaQ+7NgKI0u
	zn9urXKN7oix/l2iJQDHi6v6c9MCS1cgfluXx8oKlw==
X-Google-Smtp-Source: AA6agR5OFUtG/N/PNwq8535QjQeYjw4uWLO1JLOAsKjXkpu6+BRuCFiHCNnvFotv4A2ReBXzk2skh2SdsmxB8iMwS0g=
X-Received: by 2002:ac8:5983:0:b0:344:5dcb:3b6b with SMTP id
 e3-20020ac85983000000b003445dcb3b6bmr20745469qte.503.1661969611308; Wed, 31
 Aug 2022 11:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830202018.1884851-1-pmalani@chromium.org> <Yw8frAv2pMfjmE0U@kuha.fi.intel.com>
In-Reply-To: <Yw8frAv2pMfjmE0U@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 31 Aug 2022 11:13:20 -0700
Message-ID: <CACeCKae_uB6O_=A6bPGq28zUivWhhyLpvb31c7gP5vMFBSetNg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Register partner PDOs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the review, Heikki.

On Wed, Aug 31, 2022 at 1:45 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Aug 30, 2022 at 08:20:18PM +0000, Prashant Malani wrote:
> > The ChromeOS EC exports partner source/sink cap PDOs (Power Data
> > Objects) to the application processor (AP). Use this information
> > to register USB PD (Power Delivery) capabilities with the
> > USB Type-C Power Delivery device class.
> >
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
>
> This looks good to me. One nitpick below. With that fixed, FWIW:
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> Will you later register also the port PDOs?
Yes, that is the plan.

> >       if (resp.events & PD_STATUS_EVENT_SOP_PRIME_DISC_DONE &&
> > @@ -1006,6 +1061,7 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
> >                                        "Failed SOP Disc event clear, port: %d\n", port_num);
> >               }
> >       }
> > +
> >  }
>
> I'm guessing that extra newline was just a typo.

Yeah ,I missed it during self-review :(
I'll fix it up while applying the patch if there is no other comment.
Otherwise I'll fix it in v2 (if there is one).
