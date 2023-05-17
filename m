Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60815111A6
	for <chrome-platform@lists.linux.dev>; Wed, 17 May 2023 15:57:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f39fd9eea1so5811331cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 May 2023 08:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684339030; x=1686931030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izb4CN7Me93wS9J1UlAZhPqaI5E+X4oW/vzIq2l0Vis=;
        b=fAWbSr5MQuSfHuwbfDUZIlGzZ54RJCaFMSaAyUvW9JokG7hVrOtNINhDSV2WaBKbPk
         7zdGjG+clgirhgY0U5bwohvJBcxDdN3tEzwUP51AqazoV6O23DztSgORa8axfnr7jV+N
         qtrOn5GLsLEV9M4pAdaJ5AAiMzm2mGY7E2mmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684339030; x=1686931030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Izb4CN7Me93wS9J1UlAZhPqaI5E+X4oW/vzIq2l0Vis=;
        b=RSqsIS4na8fkw42r7hAT7SHoWgfHF7GgGEoHFnynrob2VZjLRxsRUZfPd81BMpfWw9
         +HAKQ8xqQGJBSQbCOSwhSkjZfonRda5qJbc4a2Gg+5q3iE9xGL63M7lUtZquxz99mFCm
         QES/B3LhPqKgACewbjZUTn8n7920SJF/xBT9TbkvgpPEB65gpRR7MyCPswRVp54Dp02y
         dKIqdivbSM525T2zmGAVfUbwvQzWEYglyqLeSCo0FftrlNBVgFDV+fgO72rFh+8L9dQd
         jfoJosfrYe4n1MEPbp+/xBHOrWO6sP3QqMRjFNcRxlrrQG2oYu12ydQZ6TnQVTXtGHEG
         SFXw==
X-Gm-Message-State: AC+VfDw6USC6z7CxMlE3hhi5PHdFaGPiuv1imJmPpO9lJ2LFoVvQ2XVB
	x/w0Pu3/BQpG3qvXP0DgxODAZOE52OeEy7u7PfqD5g==
X-Google-Smtp-Source: ACHHUZ5/rt84bwCwdDlTQ700bAQBPYaCE+UkLZDs1rc6ifaRzmz+ShSpnXg6viaQZQutotCOEdLdTDKDcMS6BBG9EJg=
X-Received: by 2002:a05:622a:102:b0:3f3:95e6:7730 with SMTP id
 u2-20020a05622a010200b003f395e67730mr195478qtw.39.1684339030157; Wed, 17 May
 2023 08:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
 <ZGQ9Y+vqWhQLHAQh@google.com>
In-Reply-To: <ZGQ9Y+vqWhQLHAQh@google.com>
From: Tim Van Patten <timvp@chromium.org>
Date: Wed, 17 May 2023 09:56:59 -0600
Message-ID: <CAMaBtwHxaevxLY7zWNDU8zbyWx=puLkeeRAjFtovvrA5pjtJ4w@mail.gmail.com>
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, robbarnes@google.com, 
	lalithkraj@google.com, rrangel@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I can understand the patch wants to notify EC earlier/later when the syst=
em
suspend/resume.  But what is the issue addressed?  What happens if the
measurement of suspend/resume duration is not that accurate?

Please see the following:
- b/206860487
- https://docs.google.com/document/d/1AgaZmG70bAKhZb-ZMbZT-TyY49zPoKuDDbD61=
dDBSTQ/edit?disco=3DAAAAws1enlw&usp_dm=3Dfalse

The issue is that we need the EC aware of the AP being in the process
of suspend/resume from start to finish, so we can accurately
determine:
- How long the process took to better gauge we're meeting ChromeOS requirem=
ents.
- When the AP failed to complete the process, so we can collect data
and perform error recovery.

If the EC isn't monitoring the entire process, then:
- We get an inaccurate representation of when the suspend/resume
started/finished.
- The AP can fail during the gaps in monitoring and the EC will be
unable to detect and recover from it.

> It seems prepare() is a more general callback.  It could be followed by
suspend(), freeze(), or poweroff()[1].  Do we expect the change?  For examp=
le,
the system is going to power off but EC gets notification about the system
should be going to suspend.  Same as complete().

Please reference the implementation of SET_LATE_SYSTEM_SLEEP_PM_OPS
and see that we were already calling it in the poweroff path:

#define SET_LATE_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
.suspend_late =3D suspend_fn, \
.resume_early =3D resume_fn, \
.freeze_late =3D suspend_fn, \
.thaw_early =3D resume_fn, \
.poweroff_late =3D suspend_fn, \  <<---- here
.restore_early =3D resume_fn,

* @poweroff_late: Continue operations started by @poweroff(). Analogous to
* @suspend_late(), but it need not save the device's settings in memory.

So, there is unlikely to be any functional difference with this change
in terms of poweroff.

> What about other interfaces (i2c, spi, uart)?  Do they also need to chang=
e
the callbacks?

We aren't concerned about those devices, because they aren't being
used on the devices we're seeing issues with. If devices using those
ECs want this change, they can pick it up as well, but we don't have
any way to test changes on those devices (whatever they may be).

On Tue, May 16, 2023 at 8:35=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, May 15, 2023 at 02:25:52PM -0600, Tim Van Patten wrote:
> > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > .prepare() and cros_ec_lpc_complete() during .complete(). This moves th=
e
> > host command that the AP sends and allows the EC to log entry/exit of
> > AP's suspend/resume more accurately.
>
> I can understand the patch wants to notify EC earlier/later when the syst=
em
> suspend/resume.  But what is the issue addressed?  What happens if the
> measurement of suspend/resume duration is not that accurate?
>
> Copied from my previous mail:
> * Should it move the callbacks?
>   * Is it appropriate to call cros_ec_suspend() when PM is still in prepa=
re
>     phase and call cros_ec_resume() when PM is already in complete phase?
>
> It seems prepare() is a more general callback.  It could be followed by
> suspend(), freeze(), or poweroff()[1].  Do we expect the change?  For exa=
mple,
> the system is going to power off but EC gets notification about the syste=
m
> should be going to suspend.  Same as complete().
>
> Moreover, cros_ec_suspend() and cros_ec_resume() do more than just notify=
 EC.
> E.g. [2].
>
> What about other interfaces (i2c, spi, uart)?  Do they also need to chang=
e
> the callbacks?
>
> [1]: https://elixir.bootlin.com/linux/v6.4-rc1/source/include/linux/pm.h#=
L74
> [2]: https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/platform/ch=
rome/cros_ec.c#L351
>
> > Changes in v9:
> > - Remove log statements.
> > - Ignore return value from cros_ec_resume().
>
> The change logs are not part of commit message.  They should put after "-=
--".
