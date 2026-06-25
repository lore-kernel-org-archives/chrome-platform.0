Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A9368D6D
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387780; cv=pass; b=YM+ITmHzWLs1XQ2leIvCrn3pgq+bE9/tJyDWPgB1rSryL+ROkgrNzkXMD6A/Awt2ZoZTOOPR9kYF8AwD+9bFrTLMwcVUAUSnwgqkSg8YE2NZhD2a4rZThbjEpE3p1vIH1GS0uxhRkkHE5I5rxqiMf4KtjfuCymbpN1BStC5qQNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387780; c=relaxed/simple;
	bh=YS0ScEyb+Lt46/Yx1vO1IQ1u3zBwb87wTDPGR3ZFRZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3ifMTk05ABBlAl8QI1fBwe1YjEaawiuHs2wM1XJ1qvZcE0CJjUOOWyn7oceaTmAITU9TVWHeSWLuI/mFwQcEwu5SoFux19loDjcunGJc1MkrJmvVZB5nphtB7/9f81oAIK3ksSjinr8x7wvupTudYFYbXf7+7+XuPA0R6I5Wlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j8yE28tX; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j8yE28tX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6fcfcdb2bso16404305ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 04:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782387778; cv=none;
        d=google.com; s=arc-20260327;
        b=iICIB01m67owy+ZgGKrvkwPiF8Q0YLfs/fMh1t2N/u2s1IZXefLgaiSEzMYU6LB4bm
         qlxO5dSsv+/kAUS+RujscIj9HBaLzQovmTiMbyIDVnO3rXQbTZxWbWHb+YTZZMs5B4Wk
         wNNTixZklf7qnPxRcEM6+dNqTBGCgulb30kn2giHdYXncdOsWiDj+VWOP5kQErwnooy5
         V1KIyhVomM9D394DKMgiQxRKptmy4II7LZ3r9b1+s2AUNbNwjWDegio7ps+TurPwj78m
         AZBx3ifDhOg1oHwL/ojK694ZMfbEIVW2Z8U3pCLwAdgDz4ua63lUESvhVHDCzC+IKT6I
         FcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YS0ScEyb+Lt46/Yx1vO1IQ1u3zBwb87wTDPGR3ZFRZ4=;
        fh=1ztsq6ZDctKcOGsuNCmjwivefW8HTSLvXCzFYkaxqSM=;
        b=G31MHMMsTW3Udr/U1uEo92feadRWbCON2c+fu/AxCMnVOAWdMDfyt03fOGQ3i4XPaP
         e65LQGnCykJbh9Ll33fbAa4jzcuqAz6219ubwJwhfVqHYb465jtGjuebrddSMDhhf5CY
         xzJAwnKttFnFD6ji3MEuc+HkrJHm/ShpG9ZjZKSdPPL3MjVor5aaLFI3WLPquj2QUq89
         6mWWCcAN38PN/+IAfs7q51P6Mw2LWMKAiTz126rvNgNQlnCWkgm1SuB8x9vy6Gwd/SSm
         So9+yrqpj0ZpZKn0bBCIP4D9KOZ/0hRXvOW3EWEMioQhr1Vei48tS+0dfqCQ1QQ6KLJs
         qs2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782387778; x=1782992578; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS0ScEyb+Lt46/Yx1vO1IQ1u3zBwb87wTDPGR3ZFRZ4=;
        b=j8yE28tXa07ZjGJ/QZKg8AsT0pjmwPSnPLQnXtmt7k1ppVq6ll2vbPGNM6GTsBNb9g
         JtwJGLSvyQoo6h+XsiXGt8wHUgqaza38uxAqg+PI7nJQhAD+ne20DV1kYSYbYzj9VREa
         /rr1HQoTOyw9ax/GGI4vT456xKXgsvs3jEOEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387778; x=1782992578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YS0ScEyb+Lt46/Yx1vO1IQ1u3zBwb87wTDPGR3ZFRZ4=;
        b=erQ/tYs6eA2Qzw8REuCoN3rteOIzT0Lsa1Pmc1g6u798+cDNKmeEDsYKmm1b3ST1cp
         /6C/PoVw2PE8Uyz47VIwcw5pB9ZAZ39uLpu6/b5a8QskckuWuzFYqpCOFfQy+umKA2tX
         8TRXFWpaMc6o7BkOuf+6cO5GcFxUkVfF4V6Nk6oJPog5y4xOD7+M8851vRSr5il9Ipzg
         cxglHAYzqUk43/rfOKSp1sbRGD+TV2hc+Vfax8/SYTzwT8B5zachsceyU2MfnE5b9Cy/
         2JJ9GAlbZ86FowAHjlgc+yFagdRaY6ekdQHoX2egJ+bEJh0dT7smv1CtAwqz26ouiIh/
         /LWA==
X-Forwarded-Encrypted: i=1; AHgh+RoDv0I3O3C4IpnvDYXiBMDEtsh4M8WA9OtuTvMJz070bLW+Arf8Xl7kPJicMoFVtNOd5f9C/lRt8OMMQ9Da5O8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvWnJEVzr3QFlXKgJxFggK4TESbcW+QQNvPVgwIc2tOTAqE/Vm
	+PSiek95RWeqzCaz0vt7YfktwMxajk0DsAkCJPhSnHn+b0FfMNf8ekGYAfC2KZZr2RHw3MFQ0Nc
	3nyiqu/9ET+R0sef7Ckujw8T92NHW1tgqUdvmr/Vw
X-Gm-Gg: AfdE7ckEx/YMYLfa3kMUPiRiMziCtrCojZwYhjdfFscMgJ0lGSng84p1nVYW3Q0vKK6
	bBUii8b8S0lSh7iYDmUMc2GJH08ifw9op6q+L8HVuKjRMroJ7vqWIbCD6NgDh/Y67YEEOZilx6g
	jOMuSxjNVV+wsVzGSLehb6KKQgxe6yuPeXH8v5mskUrFSSrjMmT6wnMS/qQbecaK38pSw8U6+wN
	gEUdNonq4Yklhoi2o4EtggkSTRcTiKEoxNkjqUYlUqDMG6SjSoMtE0/ow3sRYKryRB2qZg67Axc
	l3OSvhf2Z1v/Sgt6MgbIaYlFSkI=
X-Received: by 2002:a17:903:1b6c:b0:2c7:f7de:484 with SMTP id
 d9443c01a7336-2c7fc8adf2emr25915335ad.32.1782387778594; Thu, 25 Jun 2026
 04:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178229037114.3009621.14045345257767446805@maoyixie.com>
 <ajwgjQQsuj1AYJXz@google.com> <CAHPEe=EwiUwKP06fp+wMYPLcivzYoUvb=id26V79D_F5-6uWog@mail.gmail.com>
In-Reply-To: <CAHPEe=EwiUwKP06fp+wMYPLcivzYoUvb=id26V79D_F5-6uWog@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 25 Jun 2026 13:42:47 +0200
X-Gm-Features: AVVi8Cdskms72eGWIlt-CScM2hRR43YqlVAlforBlNEbpWWkzXHZQH8tL1UJJ8k
Message-ID: <CAMMMRMfYghbH9VR9zXhYWwEJwz6vEtmpv+yd3b1XcQ--EpU9vQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: reject out-of-bounds PD
 cap count
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Guenter Roeck <groeck@chromium.org>, 
	Kaixuan Li <kaixuan.li@ntu.edu.sg>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 7:17=E2=80=AFAM Maoyi Xie <maoyixie.tju@gmail.com> =
wrote:
>
> Hi Andrei,
>
> > Are we only rejecting `out-of-bounds PD cap count` here?
>
> Yes, just the PD cap count for now. That is the only one that feeds a
> write, the memcpy into the stack array caps_desc.pdo[PDO_MAX_OBJECTS].

If the goal is to protect the stack, why not add this check to the
cros_typec_register_partner_pdos() function?
Furthermore, as the name of this function suggests, it should handle all
PDO-related data.

At the moment, you are suggesting to ignore all ec_response_typec_status
values (not just PDO counts) without clearing any events.

Thanks,
Andrei
