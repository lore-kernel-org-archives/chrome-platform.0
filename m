Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EDF3B47F5
	for <chrome-platform@lists.linux.dev>; Mon,  7 Sep 2026 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762614; cv=pass; b=tT3CQ5LJphM0nLL8Z8AKtGjb7VvLxFp9bwNvnq3pkigfJPzEivml8UWil3+dLs6SicK82AouuYu9W0fkVvc4ZfDZXT/7lG3Juirj4LUIddVUvH4X/jrzFh39rcnsv41mb92XKTlnPXNgCTTvKzRIdZR9/gr53a3t2d56vnOPHK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762614; c=relaxed/simple;
	bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frcL/DZzWrnuhejY+Pij9J432Edzm2o0dLwYeAIMWKnf6KlYA6nKQjtN5xopnq07FMDMdRzPCJxkZvs2NEh5s3Rc5ZiNdI0nveaAejOz5vCKCDHwEMtU0mwH/g0DxQaoSJw6b7hZz/z+3tCLNPYyOUHXQyN9F+ewGpza9kf9hfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=RokyTTl8; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="RokyTTl8"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e8535619bso52189846d6.2
        for <chrome-platform@lists.linux.dev>; Sun, 06 Sep 2026 23:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762609; cv=none;
        d=google.com; s=arc-20260327;
        b=KIn7lXyTIE3V5rIaziIrjYheSb7JJza65nTUo8mFkg3DESol6oWXPckaFHxp63f3/W
         5BfiAGIm5jmv2Q/gukFhKrFWddnUF1FU3ZI9y8W/9HqEefYthEV/Qxlx/yI3ZLSf807h
         oOSu+rk/t2Ch2ntBGAFx+8eUFCDj5IG4mS1gqgl8b4Hgou5jFZBxfqnFQWABp597AG7p
         M3OL3RXFT1UueVAzkGu80uP7TL970vwJlUNV0edyRmHLrw+xGyTA1JLkYn3p0mAMU51O
         WHFn5UBAlEKueiDcmrG+HaW6nIV55Pp/kQ1n7+SklQe1zApms2NQMYjquRbPn9oXhur8
         5cjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        fh=r81N/hBmTUK4Vrb+AFnY54vHns7WkJHRmA9UKM+lYDI=;
        b=jx5cZpCDdwXO/YYYk4TqWQ5/XYoEQordadVZqqI4y4Fyt95r2QCkYipVgMLfdGiArr
         /QVk/s0cTeDNVBFG4vr1xfBJeYttdPQb0qPgTPeuAxnzEULyf/lN5EFFsDjlhVbn6Tiw
         P46A//L8s+crMF0uuFV0Hfg95dlW3uXJek36YHmTCeOPxLf6XadV8dV+k6xdG0EqALb+
         k5+oESZI/zF7RO78B+79LhtM4mohblGmxmqD9q0zoArauN+T3rCQavR1ieKAmvbDv6aR
         IPKcZluiGvFGTMNeCZRpSKM+r9iI7tGlfmVzdGfixt1hqyIFfzHjK7dUuYfC66bF6vaU
         k2jQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762609; x=1789367409; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        b=RokyTTl8dXO+iSOu4skjBiA2E+JTps7Sbs+zh6RiYerpswHKIxL66kz959pfBwdbCX
         QvDMkPMLxFVTCMmUTVU1xIarnqf/vn3YyS50T5rpy/gU9y7h1atSJ/5Kha4yswLKCRFZ
         /Yt7QD7NRBI2gUJAcFFuE+MeqdLLNBIhW6Rwpwdt4nj604OIC1NvcjFXrirujuDP1UXZ
         FNTPAqQX+c8jJlT1P6o+tfnxaL/kMXWIUob+KD9FXiWfOPDYmCEFSRiCxusR2MKXmhtm
         npk+Hx96XwR+WX6VjIrLn4ZSm/o8w4BLeuHtMk1pFr+/YGi2XSibg1utuqYSRujitRow
         2nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762609; x=1789367409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTlSK8IEuU/ZfhP4e+N4l6mYEm/TqMP9+vi7uMPINYw=;
        b=Vrfgp3J/h+KaQ8A623y0DePIV7lOfr8piD891KbyU91OpXhtIDBRgn29dkhMg1Cm8b
         J2jI7KaT01i9thQrOomTgjG/1J/0oYHAdckLY0ElbQeniEKtm5OeQHvWpswXeXpB+FuH
         1LrdiXRw/wxv6lnqsZc79gYqNoWi2vTJW0cyPCc6VmqrMYk1zQg7MyvonXgkCNWtyVAR
         HWw0LluDyAbHxNLzj0fHhiIm61Q5qA3dUGr9Hia1YKfKrzCvQTpN5vYBzxtc9o4MP/+l
         sOZqmDkx5ZgVtYvnjuI13Ye8OWUzaekA/1L40fqXMoNfOuHrlCzpCDDktFl+Kxj0+Pt8
         ACeg==
X-Forwarded-Encrypted: i=1; AKwUvBxXWpZcqmVqqq2/457Egg8NgzHi9o92l3eNuGTrzTiJp/whnrv13FXXANlSsMhsRvEOX4KBPjJpWcjeIf2VT4Y=@lists.linux.dev
X-Gm-Message-State: AFuF++neLB3EVZ4eqQQJvuKQ3A4KenRl6JDgqpqs20D/3GMtDGGEYOGJ
	BQgcC7LNLWTm1Gx0aBeGNpoWHgn5VQUfrHj7Hm8j654Rag0zX/M45MhYmx/s6PFExpSOgH2eUtq
	a/MtdWIwJBScKt8+aFE63UClX0t64Z3sG71KR7laWZw==
X-Gm-Gg: AYBFou2s/Rq6p5cVcAktqVKXTmRbocJmA5seQSCk53yXrGGljuJnlqEA/WFnvMZJgVo
	OdAcBaohLfQapJDzgOtCfmPUFkx3iRweQAv7eZkrM0PBrfZE9nApmgocHCWhnx7F7afXnVnwPMr
	VXbKpQO/ihgWY73lmyTiBRvyqLYr5aySZLOjT1R5RPfrJ1YH10qPQyb2VSj/U+bwil3XePjlJDC
	E7dnXGXXzaFCZjxdcFiRzuiEAx9m4tbgXdbHHkbTN7bXW7Vk3IWRsgWDaes0prFAgVkjlO+tHxy
	EymHpz1qOJQSn9kjoP90yXkNmLc/63BGlDj1mJCp+W6sI97XyJ3+jonbD16nI1poGdvW9UdDWcf
	875Y=
X-Received: by 2002:a05:6214:482:b0:910:4baa:98ae with SMTP id
 6a1803df08f44-9104baa98f0mr120884516d6.1.1788762609584; Sun, 06 Sep 2026
 23:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk> <ap470yV5nunouUL_@google.com>
In-Reply-To: <ap470yV5nunouUL_@google.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:58 +0100
X-Gm-Features: AcwNN1WRvyX32GGQfQgurGPgW7Z6MfiXEQmYZW8OW5bVbpbsLQ_b5OXFZsk8Jok
Message-ID: <CAA6zWZLxEi2ep7HYxMP-p398cGwoLD4r6wqU7mHBbBAGn9YicA@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: use named initializers for acpi_device_id
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The file has moved to drivers/firmware/coreboot/coreboot_table.c recently.
> Please rebase to the latest linux-next or for-firmware-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/
> and resend.

Ah, will do in v2.
