Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EF3E51EF
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650936; cv=none; b=M5A7Qm+IpHkKq+SPkLRrlMM74fkqZyv67HK3J3wXBjoO7yb7HY8GekH14kqhMFFGlvsxVjovQBr25arxejMR24oJ23qBP+ZMgq0m+7DMC031GjYUUQHAvItV5DZa83ds9nQVJuYlD5EHQF10X6wn2N2wNdsM9dqypewtMW+gK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650936; c=relaxed/simple;
	bh=sgkUUUofKk4XRaG+J0UMLKLbX06fVhxE4SnsPsEWBwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ak9kc+Sh5cuSqTm46FH8yYitKzlm8Au+AsIlqoXYs8lMeifI0GTCBG3Hw3FTLJWLAXpyQgMieHrPSrcEpA7oKrjKtGC7r61e3IhHv7F5lJng+4bVsbkpxE/JF2HlUu8a7NrRTNf64YnQde8dCwNDyH7CVLR/xpdL5Rh7rxMytm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx6vu5xb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx6vu5xb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so8683521a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787650933; x=1788255733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JK28XhYIm59KeOaoUdt1w0lQmpTjtM9MMAoGURUqk6s=;
        b=bx6vu5xbtG2Xdh2LErlKNsxkEUGrZj66i+B0W1MZP5D5Ipbuqdgf78fOex0p8cR1HV
         mBcyask2WKh1bnuSjtug3PupaffCBce2uWFcdpMIkzK21O1EioFGZ9LBNmVeTOU49MX8
         ucZ68tFwdRtNviEh6zwOcCpzjwUTOCqXyu9zRZN3T/DjbGUFzaqK0R2oj7n/QnHqhGAF
         Z2tlY7jedoqkLsdh0+7DLnDz3JH7Lp7Zz56eW4bnKA/PjhXddmES6NFw0br5j/Y2+X9C
         PmQJoDwlNvsBXcgKTOOGDmPOzy4fNmcIPP7OokgSqEw8X22c6AJiqXTTSuO0KCC+UxiJ
         t2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650933; x=1788255733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JK28XhYIm59KeOaoUdt1w0lQmpTjtM9MMAoGURUqk6s=;
        b=SU1OB+HvnIYpJTiM27UR6YoU5YToq+GktfJqhI5tbQ0x5dSa9WEneRHqtNPQMima0R
         ssBlON3vm4+69B5n7PfBvjviOdhXcrWSw8HVtbaoP3MP2xsD8GXYXKALhDArPjcVUVZw
         Wn8cEWvhTezSK5DVEdNUcDBCDLttnVlpW9rBKX0FOLM4mfY7AoXDBiaCO4eGkj9Tn2pR
         YMxjdFpGTk/xpI14H3woL+He2rkGXeqfKwk4mLt+aHW3BDCxR9r5Fn67Vo5a4CdLNffp
         C4D/9lpenX9znXr4mh7PHMntfUtfDCdTBlZ90WJthvtJ4zXg4htgP0Xnoj4YHsayrqVQ
         IK2w==
X-Forwarded-Encrypted: i=1; AHgh+RqtLElhXsYqJe+TeMOReOlr5O9/pzvb98uAZrIrYKdfx0KE7KIEiDngEp1psqmIdQH2i19rilD4gZrQp4GDYHM=@lists.linux.dev
X-Gm-Message-State: AFuF++mdWQbomLUmoRGKufoCqkldbta6VkO0FA+xkuQupRmePhyeGCk/
	FmWGlUYOSaXxOZ6OjNVy9ChspTiIxLntj8DeZ8sTCc7vqJfvKMJqiq/D
X-Gm-Gg: AR+sD133EF93rTQ3LxXhSlLjJSihT8w3uHCHvLoPk0WlapwvsTfvFyqwFxQsSFWYdsS
	H7BaOJGO1jYV9G0JWldXoJgiiwTyj90oFeJSx43VGq+7v388OUdA4O7lEb7UEOCw1h+wCdL/ho5
	CdmLG9gTZL/q7a5+QQNNeNkT/n2JC+iJ6dNPA64xwYOhr4Pd6ywjgkori9e9DxrU2ct4ywUtqvR
	34BQji52CIe7iNRwjVoq4/7wdJmE970VmM9jg4jk6nWUjU+CQ4/PnPrShiy+BO+sLAaRiXt1kfa
	JAzsxOPNot09sHcFQ9+Yc9K/QB2sHi46nHqiBVZgkGSoJ+OZPO6vhAyMd6qvXorEAtPEhRInMJq
	v89mdicWyR1JxndParXRc5ULo/1MjkTLpYoKSIRSwrarYsw1DpXrwM5LDfgclE7xyNhSeHYvcsF
	HrDD2KSJZuA2MOJoFnwuQFyvqxoD3mdyyCj7Xg0sRXa75cjokpdxG43ubFrPoFFF/OeEvp/BOK6
	vKWe2pqpeiYLNqr8zniQ4wupFv5Nj8NPGAdxB6vEjlxB274TB5EgOWdbMJOU+PWFt6Si1lubF8O
	mLgzu4Fkgtz7y7I904HKhgPoQFs72j0uSTxVQTOTZEre+3nPiH3tuyF0rcH/LKOmZDRPw4tDdeR
	R2T+/g7ucd0vvG+vIm7WpTuG4EyhDzVAkwP1eOPHVP8gbUH6jjHDm7p0tjBS9lXlVb8mo/Q==
X-Received: by 2002:a05:6402:2788:b0:6a4:32c0:3e93 with SMTP id 4fb4d7f45d1cf-6a582b78320mr27645092a12.13.1787650932802;
        Tue, 25 Aug 2026 02:42:12 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2d8ae9sm13858381a12.28.2026.08.25.02.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:42:12 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:42:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: andy@kernel.org, bleung@chromium.org, chrome-platform@lists.linux.dev,
 dlechner@baylibre.com, groeck@chromium.org, jic23@kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 nuno.sa@analog.com, Tzung-Bi Shih <tzungbi@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260825114211.00007c1e@gmail.com>
In-Reply-To: <20260825093524.285443-1-triet.hoang.dev@gmail.com>
References: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
	<20260825093524.285443-1-triet.hoang.dev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 16:35:24 +0700
Triet Hoang <triet.hoang.dev@gmail.com> wrote:

> Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from the resume callback.
> This is a straightforward cleanup with no functional change intended.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
> Changes in v2:
> - Use EXPORT_GPL_SIMPLE_DEV_PM_OPS for cros_ec_sensors_pm_ops
> - Wrap to 75 ish chars for commit messages.
> Changes in v3:
> - Update commit message based on feedback from v2, and added Reviewed-by tags.
> ---

Please don't send a new version as a reply to the previous version, it can
break tooling like b4. Additionally, please wait at least 24 hours before
sending a new version.

-- 
Kind regards,
Joshua Crofts
