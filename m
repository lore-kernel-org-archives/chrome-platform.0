Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0674369234
	for <chrome-platform@lists.linux.dev>; Wed, 21 Jan 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029238; cv=pass; b=haRWP+eIQt02GmdrQ1F6F6NCOjO5LyVGvQeJk8HHr0yDynXtk1b98nHQQ/ABzF695ZknmNtoeCVZgj6HkYL7NVDXbv1fO8OeU7u0t+FYTuITeRWe2p1mj3mTNNxh4shR/xxGGdTbRVk/CGQLvWQTOfSoY4e0TTrGykKKc6nX16c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029238; c=relaxed/simple;
	bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPCGUFpVrHkSaNpheSckhkBciA6YE0HiCHkysWefo0JKgh8ply4q9zaMEK94xWQhxIHJlW1+WPx2lm48cuda/HiaB/eJpGn2WWLJ4psCGRlkRCnsZF7eGni77nhUGKXETOR04NAAGtK7aePbzky4MMkmdtAgLfQPfXnHmMBEXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=X4O43zzP; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="X4O43zzP"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fba1a1b1eso5716117b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 21 Jan 2026 13:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029234; cv=none;
        d=google.com; s=arc-20240605;
        b=iqVvusCnfOrfIQz8ka+LzE4mcFTngr27+/oKjRnNm+5zzqWRWhbAhWy+6gSjygvKEQ
         dOgpaCwlx5D9Ac4NGZsaOxgcrpr6G0AdI4hFzixgs/bzyEA58ZBcmXIUOtp/i72XdPlV
         tu7OaBDYvKTODGOo8b7SrBBQYrlGngGOdcwuDnCXkbdx/mtn3E/m4e+yBV/dpbnhecIv
         3BqNxmJEA9Qqj8/TkQdJsP0nrF5mnBGod91T7JOinXuBGzq5Dj3eogHJJ82tPsB9XfPY
         Aj+9xdrK4M51NgkPJiB0x8g4Vvz2D4MSZF92fzT7utyqjxBqXkvVI5lB+DTqYu/b2jFY
         iJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        fh=GJfq8dJX1kYbA16uKPN+rQZCt9uovF99cnVD6/gU/SM=;
        b=Po+Z/ZyjSPPhN6kz94wbvx2doEKhRKw0yF9cBDcQGKhzomL9hBWYZQpH5554nhOogA
         sFhbAHgIY1ezpjoQU6XZz9p0knx8cQ0UqXd/hyObX5l80G5je9/1rGDXft1Zoeu8W7yr
         PyGPJ1F+TKYtM/T1nRR0D9F24YLlbuXceEVC49yxFeJHf8RPaiAN+u/elJQawtKe3nnc
         VRhlRLYZOrjA+JOl0X7Q9vqTJj440c7/SphFiQ2i6yYqJdBOx6/JtfaP9DMIfW5ePWLo
         yPJgrgJDUc0E2W0mQFOpRobXTy2e5A9jtmT7labyYalzULRLsTn2CEct7rdKfqqD+Yip
         TvIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1769029234; x=1769634034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=X4O43zzPNjJRm88MYqrRQ7O64I59fhikk4uu9azMU8V7J0psOnAXtdsQLaY8yCgQxh
         SW1L1K74LNROmkp+55zAJnSN5xUFkAXIOfgbLcAjbYQxFD952M7zaJI2+N1cwhKq6/gY
         XqMgeLDKt2cplflCmylXHAhjgWTCnrrVZkorAQpsdrNDY2uXA+x/py6R279lLFfUKL08
         noQjjrlO3WUKNXGhfneMeSMs0xcsJ5yzYSJXhJDUxnQnI88Ya4XYciBKa5ZOEdOhr31z
         RcSntuIf69njD6DofeQE7FDRIL3uNr4XqiDft0Exa5Ny+qGe4hn5ujgqhP17U0dOtjw3
         WMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029234; x=1769634034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=k4wwvMbACKTaJp3e71lbmkd+SRAHmXkUfbH6/Hdt+IbYuP88bpX7f5N3QUzHgEZE/c
         F2ARc5GDfOhPabEcBXc5JOkzbSKLLhHLDXsCrFEjqBm5nVJSNUxEJYdDbBPKsZrRE6/V
         /eSQbIifsyqkxPePjEP0TMwQfuww2IIoRxAKBVxXEPuKhpmtUlDS4YrXwxVhjI1LwVkn
         bWq7tNAlCFcHqZB7xJAZI7uUjw1ScZPj77hQCe9+q7i9aeU9ji9fejdAofaW299B69iH
         xLfXMujSsNACHKvbtxEMnS0lhmO79DBjcSNWeJHMqmnvfuWLavTrNo8ePIdqjGTrFns3
         YGmA==
X-Forwarded-Encrypted: i=1; AJvYcCUa2X89DdezzDJabczmPqwMJHKx+hHZI8QSztKagyOFjrzuPerIM6eS87CIBB9ybvZJZwjFN1YrU6lOsTt64TM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2agXPyXZGgkgS/M0YnsAZz4T/V9Ah5o/GzKFjk5xD+mmibL2Z
	viNJ8uDitbVVFvQHYKekhBBv7lSaD+cL6vXSyIdMmmn1mDmHVty1+MZ/Tm78OD1Mq9pa58zDIp7
	bvlGZTHZMbvvBZsggSZe363XDbAg+9SC7h2lLl3/t
X-Gm-Gg: AZuq6aI8i4V/Ubk98WWg4z8KzqLtc7r1yWEKzwW08bKIySyKoHRhNyXH/V48RYkIFMp
	QY9uKA2Wl2GwUGmSlxPI0xndVWWymRYdC4ysfwqaN9tgDUmmubqhhuK/f2SmoNmOhbU2YzcqFhJ
	IpZBiXirDalKBT8LxFsfMRCCAG2SBZPaOuPqJrJNuzLAgBJH0CbKAKtE4ccYJgxi3F4w7FsLNro
	8cuB9XTPxHqN9B5lG6vGoIQQN2ya5naovoBSFlKKxYXjI/Ey/Rl/8tSXAT5bbJXjyGm0Y5q
X-Received: by 2002:a05:690c:6c89:b0:78f:cc97:f8c3 with SMTP id
 00721157ae682-7942a823863mr6872937b3.32.1769029233841; Wed, 21 Jan 2026
 13:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Wed, 21 Jan 2026 15:00:24 -0600
X-Gm-Features: AZwV_QjEkOnOrkGBOFHQRskKtLJqCO6O_X6k3EbAJUB8sn6lDOvPd9EiYufqiA4
Message-ID: <CA+BfgNLgZBDxtPQM+s4Q6PXnNHWGKXmSAaoMFdHnfFphK9aAig@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hwmon: (cros_ec) Fan target and temperature thresholds
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Stephen Horvath <s.horvath@outlook.com.au>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 3:46=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
> Tested on a Framework 13 AMD.

Tested on a Framework Laptop 16 (tulip, AMD AI 300) and a Chromebook
Pixel (link, 2013) as well.

For the series,

Tested-by: Dustin L. Howett <dustin@howett.net>

d
