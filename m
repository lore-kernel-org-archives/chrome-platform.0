Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385694B1CFA
	for <chrome-platform@lists.linux.dev>; Mon,  5 Oct 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211866; cv=pass; b=JErAstnuZxpx6XKQD8gJ9NkJWX2plOAicfLeeFkBnzMm1KwEEMpLIYZ7mdB2AvlL3uxKSiXbAosMIu163QDdI982ekIfvGMoYxkIvXMpOg4QNNyYrCT3Xz5BMI9Pmo8nIjtnX9D9hvBmSQeymx90YsZjL4xxFBLQVCm3UYYqz9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211866; c=relaxed/simple;
	bh=YrLe/bgyFwpgpqiHffOcUv8w8epm9xRDZev+pTSWF4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFvQZFYBayREc1w1TifC71x0wbL3HtonpHqJRX2iGmJOHWfKp+IamR7K5YRNW9a0x9M9FpQDy+Pns922HjqkpJx+TGFDoi/PHOM3bX1vbB/nXNm07kA74SZrIw1nKjbp+iHWYM/apHc7hkVz4PAbs5jlmjXyNYvM64siQR3hOIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Peo4nMtF; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Peo4nMtF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1480241a91.2
        for <chrome-platform@lists.linux.dev>; Mon, 05 Oct 2026 07:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791211859; cv=none;
        d=google.com; s=arc-20260327;
        b=kr4jKASj3HEdNPkHpXUCxe2+40T7zSQwOZwBcIVSOeaFmR4Casiy6N2fsVxwfatig9
         /d8qIPL5xKejNStgceDA6pHeXslKp90gcTqJts+1VuyokELTNClmkHRVXe4GazjfmU6H
         6ADd1BMXHa5+fYUF9egsjnry6eVq97jjxvcPEGr/lgQWQD98x+FG/xyQ87DtpOGjeGp2
         eiG0V2Z5r/hYsy5rAIgkSr/5QRJgvQFF3kqB6PJOewYNpbd44D/1JL0O07IJLPj/RXDc
         +BxocA9CgdUFDf6PhjmSRkbg1G7RGUbgE3KNqdfezYnFwJP5QfPg8vlBN38a2lcix8lH
         LCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        fh=IIV66ooHRH8ERKTByzQpEr1tJWrbRdnaSMJ5mJ8TsVk=;
        b=q/Wg3ZGjo63jhOpsY/AEnPZQs0RApyo6w7rDl5/EDPVAjBi4tTHrDj5j9yiHv/UQPm
         JeduuuxC7qOw/6YzYF3zXOD4EEvyWCu1rEemmTyTBEpUAhtTHhgBgA+ey6OCopG8R0XV
         nduNtxN5lG+4b3z6C61IYIfJZL/+N0iPk4gjk2ZpqLp1OikbeSAyg6F3xIJg7sehmlM4
         +QOhkcGJrQnSZeQnuB+bgPDPnSl3QzaVX9B0NdKzRtKRc6SmM8QSza5Rc8wMi2QbxnGc
         Iz8K9iCOFDuR8cAU6b6wRlCy9J49JdRysz8ZHCV1Ogj9fMYVQ7RPlM2VZaUhGYPNqXG8
         uJtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791211859; x=1791816659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        b=Peo4nMtFtsugDEUEnPv8ru7PZvFbZMXbeEmihdW6jpqfVzFPpCJr7Pg++nkqAwYleF
         DBg8NoSg3XAE2fYf9nin8+wOkFdaECpAF5gXYq5TiKUgsP/AItVTe10CBnbSEfs4hm+d
         yR4B8rwMeGn6CjdHhgrujIjk01XpRX9Vmr8HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211859; x=1791816659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzyxtCc/xljY4tUYv36NHbjTq6FZebesi/It17iHYVo=;
        b=Z8FfMTSuTT1cX6k6ixpI1PFeI6SvYwySneRTts50oZhEiA+u9JbCeQrKfxozvcOybR
         XtoW5vH77+2Zpf7PKCn29mvF5TDdxax5SWdLrVsA/TicEfb/Z/bdkduiOzErAyem+hnl
         CGCyjy/PEv01xQdwuRFcLMvgZbWfSY7C7EqImiFQw6wXwU4P1hMUmKzGeb048pNoCNFn
         TdguYmvwDOhJ9Gu9gtf1js0yvB00NJ+uIouJh11/QhgBcEvznlyVxWeHMkpP5h56LE8c
         tooET+TQhFT4yyLGL14FXYqoKx72T6JaQp+d3VM+0jbtymUM8AIVFXcFrs/4Khi+koWk
         ltHg==
X-Forwarded-Encrypted: i=1; AKwUvBxeWveBYK8zdBoYcgLBc0SODWzLSITjfu+MvJBO2a9Ev0J6LdwuMmoxVFA0PUT32XUd4Vrjv5lPQ6M9Dm70f/w=@lists.linux.dev
X-Gm-Message-State: AFq9FYKk7Wt+WPXq0xabKRswrOIYqE31gd6Y0YUvLUN6RRafLyYtUay8
	hJ4X/VYMSH1KJ1WtfgWxJqISUzbXk9oatPbX9VvveuVGFnkM5iKvwCmfM1bTf6FIgz7nmdAjgFl
	HW/IWaXL9d93ZS++WEBL4i1lwG6r79XiZm9a8EOG8
X-Gm-Gg: AYBFou2UCQ/Q5h86B1gt/duk6rlIpysj0IXVfqYKscUBUcjOlNY9JivfBqyCH6nhjXf
	ZYvmUAkhRi9027l6Mk/Sr5Cpo+YQ+WJTFB/iQiBBrP5+dSc6/JLDkIuZ+5nVnlvpR17opKbdpCs
	BgXWLSafzEXmY8RjeSgCjbvMd76lx7ZURusDyOhlIUcbsDDphJA9xl+rdnBXxoFnR4qxBlXlj0J
	SzKrFdpG0FkZzk/xDpKHzlgkp9uRjBuMdOACpKtG0/lm+JVDYvkuc6g9YLUbQsDBiDaDEBi0Biy
	AyHuq921UQQmHx17fDH5MgNB4Oatb7SXme2DJiRNheKStBnuz2rhGRPRuJKyh3LHLNPKzyRbKZ5
	48RCVoNwlffcKSJp4HA==
X-Received: by 2002:a17:90b:1c12:b0:3a4:9f7f:8cc1 with SMTP id
 98e67ed59e1d1-3a6ce75d149mr10175210a91.24.1791211858800; Mon, 05 Oct 2026
 07:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002200108.399258-1-mhun512@gmail.com>
In-Reply-To: <20261002200108.399258-1-mhun512@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 5 Oct 2026 14:50:47 +0000
X-Gm-Features: AclHuK_mpqiutglUoj4b9ypzT5hG7wQQ6C7TSD5Rqh4e7VfHWJcwxGbEsSCz5v4
Message-ID: <CAMMMRMc7ZfanRcM_i8dCS+51Q5-dpTKnMvFJuEsvgF5V80iwHg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Stop altmode work
 during partner removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:01=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> wr=
ote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses. Partner removal and port teardown do not drain this work,
> allowing it to race with partner driver removal or access freed port
> altmode data.
>
> Disable and drain port altmode work in the common partner cleanup path.
> Partner drivers can still queue responses during removal, so keep the
> work disabled until they are gone. Clear pending response and DP status
> state, then re-enable it for the next connection. Cancel the work before
> unregistering port altmodes during final teardown.
>
> Allocate list nodes before registering altmodes so allocation failures
> also use the common cleanup path.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Quiesce port work in cros_typec_unregister_altmodes() before removing
>   partner altmodes, covering disconnects and discovery cleanup.
> - Re-enable work after resetting pending response and DP status state so
>   port altmodes remain usable after reconnecting a partner.
> - Cancel work in cros_typec_unregister_port_altmodes() during final port
>   teardown, following the review suggestion to use cancel_work_sync().
> - Allocate list bookkeeping before registering an altmode so allocation
>   failures use the common guarded cleanup path.
> - Drop the v1 Reviewed-by tag due to the reworked cleanup paths.
>
> Previous version:
> https://lore.kernel.org/all/20260917204209.97699-1-mhun512@gmail.com/
>
> Validation: apply checks, whitespace checks and static source review.
> No build or runtime testing was performed for this revision.
>
> Remaining review point: an in-flight port active sysfs callback may still
> queue work after the final cancel_work_sync(), before the port altmode
> is unregistered. Please confirm whether that ordering needs additional
> synchronization.
>
>  drivers/platform/chrome/cros_ec_typec.c      | 27 ++++++++----
>  drivers/platform/chrome/cros_typec_altmode.c | 46 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h |  9 ++++
>  3 files changed, 73 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 50a68819ceb7bbfbd888ca919d678d4c75237c26..2d6cbb7f51445fde4b4e83390=
81e921a9a143a92 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -282,11 +282,19 @@ static void cros_typec_unregister_altmodes(struct c=
ros_typec_data *typec, int po
>         struct list_head *head;
>
>         head =3D is_partner ? &port->partner_mode_list : &port->plug_mode=
_list;
> +       /* Partner drivers can queue port work until their removal comple=
tes. */
> +       if (is_partner)
> +               cros_typec_altmodes_set_enabled(port, false);
> +
>         list_for_each_entry_safe(node, tmp, head, list) {
>                 list_del(&node->list);
>                 typec_unregister_altmode(node->amode);
>                 devm_kfree(typec->dev, node);
>         }
> +
> +       /* Port altmodes are reused when a partner reconnects. */
> +       if (is_partner)
> +               cros_typec_altmodes_set_enabled(port, true);

Have you considered fetching the port's altmode using
typec_altmode_get_partner()?

        const struct typec_altmode *pdev =3D
typec_altmode_get_partner(node->amode);
        if (pdev)
                cros_typec_enable_altmode(pdev, true/false);

This allows implement cros_typec_enable_altmode() eliminating
unnecessary checks and the additional loop:

        struct cros_typec_dp_data *dp_data =3D typec_altmode_get_drvdata(al=
t);
        if (enable)
               enable_work(&dp_data->adata.work);
        else
               disable_work_sync(&dp_data->adata.work);

>  }
>
>  /*
> @@ -366,8 +374,10 @@ static void cros_typec_unregister_port_altmodes(stru=
ct cros_typec_port *port)
>  {
>         int i;
>
> -       for (i =3D 0; i < CROS_EC_ALTMODE_MAX; i++)
> +       for (i =3D 0; i < CROS_EC_ALTMODE_MAX; i++) {
> +               cros_typec_altmode_cancel(port->port_altmode[i]);

That won't be necessary, as the work queue is already canceled in
cros_typec_unregister_altmodes().

>                 typec_unregister_altmode(port->port_altmode[i]);
> +       }
>  }
>
>  static void cros_unregister_ports(struct cros_typec_data *typec)
> @@ -901,24 +911,23 @@ static int cros_typec_register_altmodes(struct cros=
_typec_data *typec, int port_
>                         desc.mode =3D j + 1;
>                         desc.vdo =3D sop_disc->svids[i].mode_vdo[j];
>
> +                       node =3D devm_kzalloc(typec->dev, sizeof(*node), =
GFP_KERNEL);
> +                       if (!node) {
> +                               ret =3D -ENOMEM;
> +                               goto err_cleanup;
> +                       }
> +
>                         if (is_partner)
>                                 amode =3D typec_partner_register_altmode(=
port->partner, &desc);
>                         else
>                                 amode =3D typec_plug_register_altmode(por=
t->plug, &desc);
>
>                         if (IS_ERR(amode)) {
> +                               devm_kfree(typec->dev, node);
>                                 ret =3D PTR_ERR(amode);
>                                 goto err_cleanup;
>                         }
>
> -                       /* If no memory is available we should unregister=
 and exit. */
> -                       node =3D devm_kzalloc(typec->dev, sizeof(*node), =
GFP_KERNEL);
> -                       if (!node) {
> -                               ret =3D -ENOMEM;
> -                               typec_unregister_altmode(amode);
> -                               goto err_cleanup;
> -                       }
> -

Do we really need this?

Thanks,
Andrei
