Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029E1EE7AD
	for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873543; cv=none; b=Ia1d9z7Bbhny20LsexknRHdDfqdOSt8YfDlEmaQroDLNN0mZ4JiVUhFF0CXXUphLu4pGiidDnZE6n9OubBmvP+WltbMfndtPj5WU7g+C6W2h1OlY87s+E91S7LbCk4l/XrY8/LQL8aWbarJuuxNH7/LWNSfStwmnaSuwCRMERPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873543; c=relaxed/simple;
	bh=vEmcpdD6utgxUgH1JFTnbgHAMBxNLl0W/XKJsZ7+bJY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ3YmYHuI/qRD5hSg+HkNB9eMGxh2myMyf4YJwu66CbyBMQ3CV3z2ka0ToMAnEd+wWye5IFDr2936BM/zrYf34irKICwHFWPgJrMJUSHwp1tT2BBjL5fLmy1CgFruUPZkXZJj/+nIn07ovWq2eKPjDu+t1Fu3AHnBjSI9rQ8rZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kwP/GODt; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kwP/GODt"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8fd060e27so31528426d6.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 15:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733873541; x=1734478341; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNSsVv7KU155VhgXVtB8Aqx0lbO0HbiZIJczhBckudg=;
        b=kwP/GODtk9pG9wA8VeY2GX6U+bM4u/09ZHD9BclgfgmyE3iEpMZ5K0ubM1F+nLodib
         wlkVTYiqRhjPQPposrPVtzYOktHYhxlUC/rL7gTaz2kwYMhqugjDBK01ubKynWALJBSu
         /GVpZHagt4MX7mVqcGKofkpCX4JxzA2yoh3Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873541; x=1734478341;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNSsVv7KU155VhgXVtB8Aqx0lbO0HbiZIJczhBckudg=;
        b=u+g7qX5JwqMKUrURhV2GFeZmQGMtl+1ZkWevpwHfbXAGlOlL2UearZ4aehrfW/a/pl
         YG/2dATXTLH5L4Ecu3JMlX1dWot3kb4DraGWtJY/olk9zXzQeyA6eXDnHVI4GUQnxzll
         2S4cjN8B7InooaHknUyh8VgLE8nFk4+lsSEvXqvhZ/JlNHQqq9n4B2Zq6RPZQOIlAN7T
         B4GX5YgmmlOyGggroEKST+YfaJSxMU9sAQiC1Z4ilqbAqG6rOsjq7pGmqIgFaCweMgbk
         M0/Ae8W0JAtflZaNo2RO7SW4XyGYuccKT8bh2HMniWuMmdMYFbBk/b2qdz+FMvZoeGR1
         G3og==
X-Forwarded-Encrypted: i=1; AJvYcCXOWDZiptjxRh2wwmwoChKdDGw07xiiZtiyq3azh7oCNwXblohm1g+vjNR+NJhIxp5lZ6iHVy+Mpi0nlExTZmg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgIoHgSUlE61QRCnubjLNzUrW62WCWxM6Wz6IlkmKDefyRYNag
	iMOBVAN6NUw0W6ku0hvhxLPxFP7XVUwYbyLkqzP0T3HpNCzIj3CdES8wS0VqcgPIduL3OBuk6ZG
	gTohZ1P81RBT5wEc9upIf5rZvI+JlOUj4+0+h
X-Gm-Gg: ASbGncvnekteX/L7Dd+j3IddDCr5gyDP3lM3PSzrzAkUR073qs9YGmkaQ46NyKCw1x+
	x9KHRhmA4HvInwFxiu3PxP/OLFec0hIhfT7zcnz/03rWtj/oYix1vgpo6vrao/Xc=
X-Google-Smtp-Source: AGHT+IEGWmx7S4JBYGfWQOD65vmgEAAhQL6zFTlZ/dCNDZNEubtkbW5GNRN0pNFA0cDECucV/k/9y1lQVSBoFQBpEXM=
X-Received: by 2002:a0c:c68f:0:b0:6d9:353b:a8e9 with SMTP id
 6a1803df08f44-6d9353baa68mr9577246d6.15.1733873541103; Tue, 10 Dec 2024
 15:32:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Dec 2024 15:32:20 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241206153813.v4.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org> <20241206153813.v4.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 10 Dec 2024 15:32:20 -0800
Message-ID: <CAE-0n52AG8henLkzAyO112pBmNAskcC0SXKFNCyQQ3MG01xkGg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] platform/chrome: cros_ec_typec: Update partner
 altmode active
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	tzungbi@kernel.org
Cc: akuchynski@google.com, pmalani@chromium.org, jthies@google.com, 
	dmitry.baryshkov@linaro.org, badhri@google.com, rdbabiera@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:15)
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index c7781aea0b88..e3eabe5e42ac 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>                         port->mux_flags);
>         }
>
> +       /* Iterate all partner alt-modes and set the active alternate mode. */
> +       list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {

This can just be list_for_each_entry() because the list isn't changing
during iteration.

> +               if (port->state.alt != NULL &&
> +                   node->amode->svid == port->state.alt->svid) {
> +                       typec_altmode_update_active(node->amode, true);
> +               } else {
> +                       typec_altmode_update_active(node->amode, false);
> +               }

It could also be shorter:

	list_for_each_entry(node, &port->partner_mode_list, list) {
		typec_altmode_update_active(node->amode,
			port->state.alt && node->amode->svid == port->state.alt->svid);
	}

As far as I can tell, cros_typec_configure_mux() is called when the HPD
state changes. We'll iterate through here unnecessarily in that case.
Can that be avoided somehow?

> +
>  mux_ack:
>         if (!typec->needs_mux_ack)
>                 return ret;
