Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F52361DC3
	for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374993; cv=pass; b=M+j/cPR/ca0vGoSlqL8ncLS9bO/iy9MpM8tHUwg3R5dnTEqUFE4ikY1lptju0X9syy5qsOlLdcRpO8Y7XUVW3Ad0r318etSaZQDh3XvOsaXr+cU7SK4wPHNHyUz1+XrB5fHWLkyIejG5ROvD9fP3WVbLRR+u8Z4zBdGcqdzLc0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374993; c=relaxed/simple;
	bh=IO1gJOk1RP0Bq4zIMdVLltbVNk5Do6LJBy2+7hH4ZUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEJPHlKKR8EZD/NInLbbH0oxCiAEX2USsAQg3bU1tGtIKTCFiOrrAxTT/dSjhEzTUNtNRUIbXYeIYo+bGiwC4BEoIwusNyNdzXMHKZgVxz/VcZ6ou9HSGFEqtMFg3gIattMjjzkEriIthV2CXsz5W2LRtkEY3Qju3JUyqZlRWsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hUH+b5Zb; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hUH+b5Zb"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so2354214241.0
        for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 14:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776374991; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8jhmgM/XearUoqnzW+B1Him8ZJreb2Cexvm6pydz8Oh/FpiyPbeGJuXfvARR5zHzu
         sH4vgvBna8J+VQOLWa341H6JOiWPXppDPTg0rpNV4wUFFPP/IqA5tjDjNketP5XxgyHu
         O65xqxjkAhRLtH7nS+FPdwVe/JqEM9qh3C2jhYvpoHsudotvaPlxSAyvgdlnlKvRcxxT
         J2JHSMZRPEjpSM+QZfpmMbM6m2c3zS3O4i8vXw3/6QQtLcZKclCi3tTvK+SF58mL31rA
         CZ4dCgnI8kIiDmkgXlJk/ZNReXp3BNYGOPmDX1thm6jPqvy/wHy2qFRx8N3YmWr43hF9
         MzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IO1gJOk1RP0Bq4zIMdVLltbVNk5Do6LJBy2+7hH4ZUk=;
        fh=uonOUtEp5tQ/VfKCBQom5WVg/edgBT9y6cWYO10iims=;
        b=aQsfdfwHX9ZNiM7LTr9HCaP1ArLXwYJpENlt2/dfK00RHQMr9OMoptXdH8c+DoQ8MC
         4upPy9r/6jP6BzmYUTejlX6RGtMCYvPjBtYyUHBYEbD0e3ekqkAuCLzHskhSigBqDyTv
         5oFN4ltJLNgPfZQUlx9t+8jwyVXiwXm/aix1xX+8Fjg2hq3GvmHkc8vXErZwS+fxBY9U
         bJfwRexXegWh8EJAWb/sUgxyGwQ9i1Nm1YkB+05h1O2xQchXRwyAnzPT3rMNdLFXs4Qj
         hO9qo8K2ep8WEoV8OhDVXBx8lKSey/s+srSJTL62HHCwFQQCPdHo9uhdhiFIQCSzIf3D
         il1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776374991; x=1776979791; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IO1gJOk1RP0Bq4zIMdVLltbVNk5Do6LJBy2+7hH4ZUk=;
        b=hUH+b5Zbl9HZP3Y8ygBqt60ZMTf/t6OAHWDjT8EhfiNn2PdyDVu3kmLsVvEiLxSezP
         AijQaVirxKN8fRYfqhjuCVW9n2L1jnP1ryY6DAvJN9XnIQ8xn34KwgEQYiZlNb++K9Vo
         0rVxSMwwx8DQGx8A2jwy+MXJhXrfd7JwLy/JMLvIflX2YMoN8or3slqMKQ7C6ZhHsg19
         Qc2csiif0QOTmkoqG2h0DS4MfJHjgtVG8jIypoIpi4BuX29f84q/x0rHfQa9iwW/jObz
         OVXQ8+nUSVS9dMQ1CSJaMeSwVbOAMcCVYJ4JzBBb5/YOrCDTdsKVi7tbv7eIFi0hSCh8
         YPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374991; x=1776979791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO1gJOk1RP0Bq4zIMdVLltbVNk5Do6LJBy2+7hH4ZUk=;
        b=hP2EdFzEaI3Ea45pRq2QF+NvorjLCxFAeL+OT2SuYBE33Q8maBh+YV1UlFD5ZkNYmO
         rtMfXkLSoHHWM0gEWDWw66wkGBdIMRBL1rc5nd2WpyzaE/gf5v7CtmYoa+rN2W395KEq
         6SQRXhh27B8XobBE62mp9vkMSpyzZh0DGiYHgV8UIsYUSRrQOzgg6MjMP6oyjDJyAj6e
         xHSEVLCznYoGEw9AEU/03L+wV2PYHbJw7haQNbMqYmeTy35t92qbC9AN9DtlH2EHPwIW
         fnHQGlep6ZCvPqj8ZHjx9oZzTH7LmTtHypIzXvrSAUAevWO+X+aKk+JgrrjfA0p6D7iT
         SrJg==
X-Forwarded-Encrypted: i=1; AFNElJ+oP2tQ/70C6ggNWtqceTHvzz7rboUMMv6QRkK3Y7+rMuqMcCHXmayFecJiT5vjrFvuqtSzsSv/dr/zzcurtAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyefb1qvRsKGsHDWvS2xSoWIvslzt4C5uGjTqX56gTbtxprn7zK
	hbV97aG26+J9eRiKT98GrFX40quxXyD8pOwKecjpwlQ/afPNnKZBOVVDammsOd7QE4q+UERFdqT
	GVGR2NvIt4XfIK5S/Dfrlf+hwVC5UnZwoNOZ+aP2t
X-Gm-Gg: AeBDievuFpDmqr4hpBfQGxx+QqEn2KsODGHmu2rvsbI4MAaonBedaCwPGWH7auTZ7K5
	Lr0pqnhiyc6+scnptseGvbHfIB4wPgZ152mPssUI6vI/5YaZTr8ZQwDpEo2ixFdI1U9iDTDEia1
	+eoVgOfc9klNCATVAv2kC876w2HFVnbr0v3b8/VV7m0Z7FiIMnfRYIXrKgo8LmHrGAmAtmgORMp
	mPxu35M9h6fpJQUuDIJxf6e9NbCinO0ZdKYOF7Tc2w51sSWt5Vet3iZEZrPhEa9RVol3p4SaI+k
	RPezcDldAsp3YCmj7PJ81Sk7AJWCnUlHu2CVACB5dJKBr1hyIUNNCbvZM24=
X-Received: by 2002:a05:6102:5808:b0:5f7:240f:bbee with SMTP id
 ada2fe7eead31-616f4f77830mr97656137.1.1776374990283; Thu, 16 Apr 2026
 14:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403222253.1888991-1-jthies@google.com> <20260403222253.1888991-2-jthies@google.com>
 <adA_-fsV_N1m5i_v@google.com>
In-Reply-To: <adA_-fsV_N1m5i_v@google.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 16 Apr 2026 14:29:38 -0700
X-Gm-Features: AQROBzChuJ1ck4WJIctpqOIWDegExrxHZDpzZBptt4WZGAv053VpipFCEwA6BzE
Message-ID: <CAMFSARf+rM-rQvy21DjxTDPFdc0a3-DW_hjEs+Rrtg3nLAqU2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Benson Leung <bleung@google.com>
Cc: lee@kernel.org, bleung@chromium.org, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, ukaszb@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hey everyone,
just a friendly ping on this. Mfd maintainers, can you help review this change?

- Jameson
