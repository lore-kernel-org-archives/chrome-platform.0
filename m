Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F134A35
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408411; cv=none; b=QvXL3jXouIsTWx0n7OXBKdL1kASQZau3+9PVpMIBTwIDQdTbtK794VmH1Ilj6smBeAbZn8bFjS9L5GE2InFhDCE4ZbAZW/C5KSXHJugTG6bO/x+4hqzh47lCOM3RxMZOjf8mRBe2pf/2KVio06e7H2HIyA1eIiWyhKg/QAu8e6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408411; c=relaxed/simple;
	bh=Y9qvfVyeQPXkB2+sVJbUknOCYCqukl5rxf6egNZy+ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHQA6kGhiaW598LOMxTevYtV3wnxgFJszQ2yrO+LodOYmoagetJdh6fGICDq431lcfDc0l1j+PsAxhEEpRT1gWwUl0C2QQdGBGx3qlztCCwOgeYgl3jNjk5L47dyEP3x7nYJIGmP2mOfc5D8n/RByMsmoXP32mY1wJlzU08LYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FrydC93b; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FrydC93b"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso15915600eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777408410; x=1778013210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuGGOB9jUOQdHhCVZcWlnsJ85f+0MTkEMCpT8PJQvGA=;
        b=FrydC93bnbxn9csQ8989l5rDjvce5VuIWcPKtn+rgkU6e4Hqbtv/Rge/nie1M9pzsK
         k9YmfOP4njQ6yn7ZOsNrqhYttQMQ34JNPSjiV0/Z9JMmB1xDnZavUMgiymbXZ6o5PB42
         ROPLsxCK/hytxrgNWu39+Yo7l2B5tEYLe2xTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408410; x=1778013210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuGGOB9jUOQdHhCVZcWlnsJ85f+0MTkEMCpT8PJQvGA=;
        b=FINaImS3LUPkswv0irvRKTcSfb6ssPf3jBSc4Ac31NMWgZhnw0pW05e2BHzcHu/EXi
         YmEJlyIa0OYYLFjqq5ZM575QHyo80L0pGqdZDcHvdi3y+3WV+Y5K9PdrSq/csRmpp0fl
         lzfLxZKQsJfdGpdxDFH9vupcvkZ9Fh6gcvQd3u1Kp1GIXAScE1yrcFWEjS0MAYd8avod
         LZCdBM7lMClSmgZLMC6I8qdUmD6mZEjyCs3qdKo+pmsrkyg8ijNIdHoy+AgzYlsXNqY7
         udRRsIlXjgjyvrVEItF48I4+nIx9AzslI085/hLwvcx9vxr5XGVAtJXtNbw3fvMMN6fY
         MT6g==
X-Forwarded-Encrypted: i=1; AFNElJ8K61KsfOejdwklWa3IpbpgVzr5pMdXPzcRDrfimKD/ghLvnaUnZ3MOnafXd5g6ZdZjmcwzaH6AI9yEmsEHgeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrjxiL45aJSx2u62ia88SYH0Sxs2UpRTKdUCyzZD7qnfaC7rXK
	rM15L2/w+mowhRg6jFwGN3ZOHhLejn8G3MSpufMNgnKfmEMXsh52C/prm95Sro0LkA==
X-Gm-Gg: AeBDies9C89Zsk9Lggrz/v4AcROmkpvB7kb+cb9oQg+TQJiygDCfgGoUtxQ1wqdef6H
	k4xxKCSIsITgQuaYaDwu0NAKC1wnrZZtGbg67YgFIDUvwzGHRV5akffTEWuNUkX3FDypf4pmSk4
	8ool7OTeC//6R01oZfbgm9BDu07RLCJ/Jkwo5JL4Jh2tOAgSuETHk931n6TVE2NSYRMvPm8CgF/
	LmXM0ZDjoexuW6pMz7HzpyZvJhtRXxLD10vwvZFsNlH6GmrhrrHA0TMjimX2PCJujzMpWA0BzUn
	pmQezGyaPv6y3OUZ3qRKCFCgRhPAPqQv5rzgN7+FhuRR/A1IYABHBt0DLvqKTMr+ll2UWpt4oLN
	JO7Y9tztAKOXZoDaw+Hn1XUdwNDPaFwM0jmAX9AVsEPUkrlmQ7XlktDs/eUVW11gdAT1mO8c0H/
	kqTHVMvH2Ia0L+4MiXDdRiQqUe3QFV2y1Xto1QJkDA6XjxkMc+Wrr4PbZzsAWatXe0ADMeAVQD
X-Received: by 2002:a05:7300:dc98:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2ed09fde238mr2090563eec.1.1777408409871;
        Tue, 28 Apr 2026 13:33:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed1bf6d391sm8879eec.6.2026.04.28.13.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:33:29 -0700 (PDT)
Date: Tue, 28 Apr 2026 13:33:27 -0700
From: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Titouan Ameline <titouan.ameline@gmail.com>, tzungbi@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: google: fix orphaned devices on partial
 populate failure
Message-ID: <afEZlycZGgTiD0Ga@google.com>
References: <20260426220204.118399-1-titouan.ameline@gmail.com>
 <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com>
 <CABvHBc7nPNoU2riE8ckT7gt5V=3PBXOKhjE2PrL+Os+Si0TytA@mail.gmail.com>
 <CAODwPW8T6o93pQodem-hNrszH_dsa5KMTu0iRY6y8CLJNjfXsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW8T6o93pQodem-hNrszH_dsa5KMTu0iRY6y8CLJNjfXsA@mail.gmail.com>

On Tue, Apr 28, 2026 at 12:49:35PM -0700, Julius Werner wrote:
> > Given that, would the right approach be to continue the loop on
> > entry-specific errors ( logging a warning), while still aborting and
> > cleaning up on systemic ones like -ENOMEM? Or is the name collision
> > case considered impossible here since names are derived from the
> > tag/index and the table is only parsed once?
> 
> I don't think you should hardcode behavior so specific to what the
> called function does. Trying every entry doesn't really hurt even if
> they all fail due to some systemic problem, so if there's any chance
> that other entries might succeed, I think the best option is to just
> always continue the loop and try the next one.

FWIW, of_platform_populate() might be a (highly-used) analog for
comparison. Aside from some top-level errors (such as, "can't even find
the root to start from"), it doesn't actually return errors at all [1].
It just skips individual device failures (including -ENOMEM).

Seems like an OK strategy to me.

Brian

[1] of_platform_bus_create() technically has some recursion-carried
return codes, giving a chance to propagate a failure, but all the return
codes are still 0.
