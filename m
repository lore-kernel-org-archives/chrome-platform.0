Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F49B107BE
	for <chrome-platform@lists.linux.dev>; Tue, 26 Sep 2023 18:58:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50302e8fca8so1034e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 26 Sep 2023 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695754679; x=1696359479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5HXQ4csQ6AKj5gYM3e0UCu+IvigfEdNiXcYzK2DmhM=;
        b=EVtbL0gnvTMJbRpZQLoOOSMGgtZlvXRzZrOOO10d9ScXiCUy18SPnP/QqlJdUgYN1g
         SEWoiSO39yrKdctOEP8ORkH1CM7wzVUIqvp2l2aRqn4WdYt0HySgjFDQt7XydEX/QvI8
         JMc6j8+MT5nc8EmnxULI1NDHElIYHQrlNe/lNdouYSKKbt7pxBCR2pil/lwWh8JXBrci
         iIKvlZm2RMi7FYSd0103i8VeVOGCWqdEt3PpOpQJ/xtVg9iKj+JfAysI6t5+qFHwPZSj
         28SBSkTGs+O/STxMMun29meYwijRvdGDbPRSn0HXdz9JH8y4tQdJf+7UTIV2q5PlpWah
         ksxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695754679; x=1696359479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5HXQ4csQ6AKj5gYM3e0UCu+IvigfEdNiXcYzK2DmhM=;
        b=Xuf2pC9iFlwQmZr3Szcud+2gkrex6WnVnKsHyp6bqAPCELNBnFslBy4CyN0KOOn7/y
         BKPSJfwzEOF/SEQqtPnAlsIq340qb9y9YQXkXflOeppqB41zxKJ9iEM/IPoBJ/0hcWaf
         FAqlHQxaJvU2L4DgIxIwaLr+D8J1co+KnbVXQ6WUWiNaCfiCz5iWn0n97lu5ThmLNCiY
         aKVf/VupAw/8+oHeib/mBPaLkDyX6CX/w6QfPpSyF8RC+DQhfonQCCGeanClWM7mZm5R
         GZS1lmZvWtH9nbgziZ/kGT925Uh5L60U2qS9XHVe15TRg767XMbPR5dLAFIpu0yagWey
         O2xg==
X-Gm-Message-State: AOJu0YzeQU7polizuou+uR+qNOcdOGunF3GiwqXIhLiMFLZIehgCVb7m
	R6Jp4UCEsTsBMm3YhgEV/YdpQqJ4SY06mLA6chK9rA==
X-Google-Smtp-Source: AGHT+IE1oTEKFiKab9FvW9pJHaZXmMEd1RN34+03vk0APuhq6RwtMVaVeLA90a2WvFOUyErWKsNZgz29dHvZg4Hy6js=
X-Received: by 2002:ac2:5317:0:b0:502:c615:99b0 with SMTP id
 c23-20020ac25317000000b00502c61599b0mr86285lfh.4.1695754679176; Tue, 26 Sep
 2023 11:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921141935.3973069-1-robbarnes@google.com> <ZQ6k1K//086Ptqg0@google.com>
In-Reply-To: <ZQ6k1K//086Ptqg0@google.com>
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 26 Sep 2023 12:57:22 -0600
Message-ID: <CA+Dqm30KGiSVnJ+z=ToT_i3xS6dN5+opCHbp-9tfd+ZqxdgJQA@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Reduce log polling period to 2s
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org, 
	groweck@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 2:42=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Sep 21, 2023 at 02:19:35PM +0000, Rob Barnes wrote:
> > 2. Yields more recent logs prior to a crash, facilitating easier debugg=
ing.
>
> The approach depends on multiple parties before a system reboot: EC repor=
ts
> on panic, AP sends EC commands for reading the logs, userland programs
> (e.g. timberslide) write the logs to filesystem, and filesystem
> synchronization.  If anyone in the path didn't work in time, the logs
> disappear.

This change is just affecting the continuous polling period of the
cros_ec driver.
Syncing the log immediately after a panic is a separate path and will only =
work
when EC supports system safe mode recovery, most don't.

The hope with shortening the period is that cros_ec.previous will contain m=
ore
relevant logs after a crash, even when safe mode isn't enabled.

>
> An random idea: could we save the EC console logs to pstore when AP gets
> notification on EC panic?

This could work. It would be a separate effort.

>
> > ---
> >  drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
>
> If you have chance to send next version, please refer `git log` on the fi=
le
> to see a good candidate of title prefixes.
Ack.
