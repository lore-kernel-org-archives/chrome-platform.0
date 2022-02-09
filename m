Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59AB2F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 05:58:52 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id bt13so3097347ybb.2
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 21:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaD/1E08d7dJtWrryf+L/r+abB3yDI3hEDZHGCB8u5w=;
        b=ZQoTGRcknAb+hn/5EjGVCsaTfh2l4Z5NW2K4FspAtx77a4oaVSjELa2aKDvEN1TzvK
         42LdWEB1BA71tVKIlDP2tXvZcNh3tLAP/IIdvGROphvBxrTvVwtPIy9AdNE+F9iKu/Q/
         qwBkgiuvV8jW1CTq9EHdM/e+I7HbpNM66dWP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaD/1E08d7dJtWrryf+L/r+abB3yDI3hEDZHGCB8u5w=;
        b=yFAFjxLY/pOuo4osOL8XNQVEhD7ZhiY6xY6IdPaF2C3RBQAeJ/dMtPNHiWxads/7ND
         ZIPmDc9co/LTS6kxgUFZf+1wf7+PI9Up5ZwiBnWbwB48Odalz6ybgrfnGWSG4jHE/Hu1
         MbQTC40Y8kVdM82sX1uadP9PyUZ7BbKQRIBqXRxKiNfOAI2hlp4T0g+rNL6d6cBu1yvY
         /Buxh65OoLNLL93gmX7H+NWW6rV6HwdzswmddxreuufsBdOc6LOj4GSJE6CzIREPif94
         g9ffSgJ5BHxmRj3C/msfxv8hZD32CIW+22hs9lrSPcdtAxpNEi9qD92iA3d59jc/3+vU
         +D9A==
X-Gm-Message-State: AOAM533TgIpldMhEn3n/lrq9ng13htHb2BWxD1VE/wtaZYh2P3qS9NT7
	bddACdE4O5YpVjMtfcRAhGnLwsgDQiVawWV3J8DOnQ==
X-Google-Smtp-Source: ABdhPJwrDxuMNGM985IgVuXAVAvKvvxzt5bMhqBAiVQzaCWkVGTnINbUks7CDT9TgttNUs726e5DnHMPyCEmekBsq4M=
X-Received: by 2002:a81:a391:: with SMTP id a139mr636087ywh.432.1644386331850;
 Tue, 08 Feb 2022 21:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-3-tzungbi@google.com>
In-Reply-To: <20220209045035.380615-3-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 21:58:41 -0800
Message-ID: <CACeCKadu_wunV8YfC8vjK2tkewseNDadbYGATc+-FX0DfUNUZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] platform/chrome: cros_ec: remove unused variable `was_wake_device`
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> `was_wake_device` is unused.  Remove it.
nit: This commit message doesn't add anything to the patch (it is
repeating the subject), so it
should be fine to drop it.

>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
> ---
In the future, please add a change log for versions here. Quoting the
patch submission guide [1]

"One good use for the additional comments after the --- marker
is...Other comments relevant
only to the moment or the maintainer, not suitable for the permanent
changelog, should also
go here. A good example of such comments might be patch changelogs
which describe what
has changed between the v1 and v2 version of the patch."

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
