Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416524C65
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 00:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716941331; cv=none; b=C68YcToU6yW+i6v4Ue3BOpLQS4vdGOgdSXrjTlCk9ycPfJwd5VPYd8iVl7/0UzLj7IEELf5tA9Xg0coYoCpuW+MCnz/dJ+ureo8qX8Di1SlKtDoxOZlnh7T/wFQmCiZg50oa0ODXjLXGBfOD+WLsH7IVeOB9tUyH0IVenZipw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716941331; c=relaxed/simple;
	bh=l7SmVIHvbV8kDeTnL1OPoOpq/9FGh0QifXQHyDpauQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRAKLoJXeqEs/TFDSsIwirkq54ZhtwtCiChSE7oA0Hp7sXMqiB90eZBOqClMv1VWAh408eor4diORi4WxqMnMi5NxPYUAw6vpL5dUdFUFpuL3XO9kY0q/KZ4DA9usclH3ePKb9LaY42zUiDEqwpIajuVZkvkNQe04boc8HgR3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hUuoU+s0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hUuoU+s0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57863da0ac8so3496a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716941328; x=1717546128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az3jr7x31F8peXLKbNxo6XjWWiGHk2yunPTmvpcG48U=;
        b=hUuoU+s0otPurlEos5jHs/Ptk/mkZw51b91VzOMPb/nHQcsJaDx8c0LRNl1YckReca
         sVZY/H/o/Mb0DijLBIWqjnOrObOCKsUr/FM2ArQ7bWHktZm5mH+xG2sSmIK7kwC3cH64
         lAKNzx8cM1iREcHSG53289kCxFhO8EJjEmM8W/tkspyonzs+9AT1rzmOcQWueinzuCYO
         pUap2xGvpFqw+GfiAFVqtVSVKQI8n7mMlsMvXBXvb4JzSHh+xQYUdCULis8ZVTLOSEcq
         Gqs7PYuu1aja/vx0/I2TGdSkCsMY5zFBSqP6pCpasDgMPB0o2UgkMb/7AYWcHBkomW9O
         b+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716941328; x=1717546128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az3jr7x31F8peXLKbNxo6XjWWiGHk2yunPTmvpcG48U=;
        b=O4cEKMzHXpp4q+AScsny0JxDMnBDsz2wXF+5fDIeUnWSTt6/vg0vj+mXhPqoA6+3ds
         +B3hmrxYDsEYqpMjTHTSz2Jlm4oHDdVb0JaRPNdHDizJ8Jgh5n1iCzAwr7VITfoZKZc4
         doTjuVI2seStLjQ4mTDBEAlV7esxBg430tFsk6HuoKqMMuV+2yIA3b21Bhxzqf0mVlaA
         eyyyH0FryvrPtu0p91CMXpRvKWuQOH6D+GUcpt+Lczskdm67kYgYqMtzrDjsleOMkTED
         5VihtyUVd4PinWdTW8Ad61Ltx5Bf9VmGq2FCL4QSOml3ChLOTy6EDz6sx4EHIMk3kITo
         jiZw==
X-Gm-Message-State: AOJu0Yzred5PwhFxZjL5kF6cuNfQBF0cMRf9+aPMgQMtIl5GCVrbUhh2
	oqF+RWc39TKwq6Wa7HAnjCgH/Asj7vX7g3Cnh4QpZBax55v7MAimZqNSkSIx2YjlNdcUCyiz+BY
	rZIX1VPAxEAdFVmM8Pbelq8AG/G534yXDqxeyqaIg4uBsZLjRrIeQ
X-Google-Smtp-Source: AGHT+IEg8rrwehhawzvTPvSdmNR7pDXe4AOl0VVWaTfyQo2Qh6ClD88XTMtAu4cSfsmYH3n2QcVtvm5ypkUKah2PhMs=
X-Received: by 2002:aa7:de18:0:b0:578:647d:a27e with SMTP id
 4fb4d7f45d1cf-57a05d1e5admr28290a12.1.1716941328390; Tue, 28 May 2024
 17:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507155809.525701-1-robbarnes@google.com> <Zk6cGhB99cktsCsy@google.com>
In-Reply-To: <Zk6cGhB99cktsCsy@google.com>
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 28 May 2024 18:08:11 -0600
Message-ID: <CA+Dqm31Gs6fkg6Tye5516tj3zyydHbQTSwP5ysy9m9Gj8+1wXQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Make log polling period a parameter
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 7:30=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, May 07, 2024 at 03:58:09PM +0000, Rob Barnes wrote:
> > Make EC log polling period a module parameter. This allows the polling
> > period to be set via the kernel command line. Keeping the default at
> > the current 10 second period. The optimal polling period will differ by
> > board.
>
> If you get chance for sending next version, please use title prefix
> "platform/chrome: cros_ec_debugfs:".
>
> > @@ -118,7 +122,7 @@ static void cros_ec_console_log_work(struct work_st=
ruct *__work)
> >
> >  resched:
> >       schedule_delayed_work(&debug_info->log_poll_work,
> > -                           msecs_to_jiffies(LOG_POLL_SEC * 1000));
> > +                           msecs_to_jiffies(log_poll_period_ms));
>
> If the value is set to 0, it works like an infinite loop on
> cros_ec_console_log_work().  Is it expected?

Yes. I think this result is clear from the parameter name,
"log_poll_period_ms", i.e. a developer setting this parameter to 0
would expect the EC log to be polled as fast as possible. This may be
done for testing, but it wouldn't make sense in production. We could
enforce an absolute minimum, but the value would be mostly a guess.
Let me know if you still want a minimum enforced and if you have a
recommendation on the value?
