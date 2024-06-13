Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575713A252
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718311836; cv=none; b=YIrheYbkLpry6zQRkgfZwFxJWyBsvvn2NZRWjSUVVMJlqeySExMrb0XsXefff+zEIzlTCIOxiUfFOdiZtIDqYdUrWqC8WpXWVsoSucrg8sHorTjrqo0WXswNVt2OGirkDO4B5T93QhXI9N0rRQ9M2glTzKI+DH8s5NpyYRoHwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718311836; c=relaxed/simple;
	bh=/iiG4vFIZ38MXvOcAlrpemCi3LyL4Xdk/H4OkWaE6LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ge7PS7aIA4aeGJEbbu1+Mo2x5eG6SAsEDs3VdMIM97QDEXZ8TG9xy/kac2m0uMgfPkij3qVXwKIJNCT6LQvocOUinm04ceCYKVeg0bWASkUPiSh/8da0NdXSuXYpvEn8uiO83jZ8eigLwGGYh1ZPuvJDcoH9d+001NFz1kk0DBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com; spf=pass smtp.mailfrom=jubnut.com; dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b=opGQI9ec; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jubnut.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jubnut.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jubnut.com header.i=@jubnut.com header.b="opGQI9ec"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4W0ZL76zJfz9sq4;
	Thu, 13 Jun 2024 22:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jubnut.com; s=MBO0001;
	t=1718311824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/iiG4vFIZ38MXvOcAlrpemCi3LyL4Xdk/H4OkWaE6LY=;
	b=opGQI9ecLlIFg++mCvNjcXejr7aZJSrHM2hnUkXN39qe5uP5zFjPMtLeCgaKBXlIAyCMB7
	h3uy1y0nHpcSlbjx33jLIn78epOgHPoza7g8zd6X5eLR2djixq73b+VXPFyuLaDzdKSUK5
	z7QMBKyxScwTExX3FcTGK7ecXMq/RQlUsUheFTbdUbmZhI7B0FkkApk3ExGzZGexComo5h
	XFa7bnnpXytw8wI9FNKw4BPrbAicmjyTZD3zbQAQkW4uN+qVH2k61I+/pjwB1YNDpH2wTZ
	R3fTf5xEmyOkKV/6ayqCtp/Fss152Kj0+hLkbquBK4+voDmCMQkNk4TsY8a+0g==
From: Ben Walsh <ben@jubnut.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
In-Reply-To: <68f1d8df-69d2-4246-8c64-4c7cc975feb1@moroto.mountain>
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
 <87sexgrdk4.fsf@jubnut.com>
 <3226cba0-82c5-47a3-89da-01ffa935a9dc@moroto.mountain>
 <87sexgaemn.fsf@jubnut.com>
 <68f1d8df-69d2-4246-8c64-4c7cc975feb1@moroto.mountain>
Date: Thu, 13 Jun 2024 21:50:21 +0100
Message-ID: <87h6dwa7oy.fsf@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4W0ZL76zJfz9sq4

Dan Carpenter <dan.carpenter@linaro.org> writes:

> Perhaps the cleanest thing is to delete the length == 0 check in
> cros_ec_lpc_mec_in_range() and add one to the start of
> cros_ec_lpc_io_bytes_mec().
>
> I think that's a good solution.

I think it's a good solution too. I'll send a patch. Thanks!
