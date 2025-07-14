Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5A22F767
	for <chrome-platform@lists.linux.dev>; Mon, 14 Jul 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481938; cv=none; b=d0mOs58UNfM5UnwGMqxTD2UJv3UP+m/nP30CQHMljfWuFkPqQDzvnrzgdemSIi9resow43dCu7o53mQ6azu+X2cld8n9fXeAkq72iqjBd/Q48bxbnATwpQfkeQFOo4YlWlHUeiv8THSBZa15x6kH5+j1vhxVmRDBoSw5MewsAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481938; c=relaxed/simple;
	bh=Go7IxiOZ0sAIGTwsDe7Eg9RsaCUI0tpzXc8tbaNuhbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhYQeXbLgqOmo4YOZByh+HvPtsH2LNWYxBW0SLfzcIT8GgkGSOa849cnxbkv/VmAMMSwA6sFygWE0/QUeOBcYtRtiMvite9vdyMEwHTvpPcNFAqEJ/VJ+Lwc7NkalwppLCi4yVBfQkkRr+rI7IRIwUcl5zD4RZaLbLM5z0N9PI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iFzVa705; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iFzVa705"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-528ce9731dbso1649407e0c.0
        for <chrome-platform@lists.linux.dev>; Mon, 14 Jul 2025 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752481935; x=1753086735; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0M6siWvZJnp6SHGUTLYeoItEe86brhosUCvwv3Sj6g=;
        b=iFzVa7050o+Wx6+vtjXYy40SZqroF+9JdWDjCOspjfJscpapGpXwcm0HwVmV/L8iAK
         kCwAbr0zY8bhFuxF796hkWVfyQf9+4oNsYNVNyJwH7EvnN/S1oh/j+ZroJfbtkqgqzS2
         8Y8tqWxIRoZsRUwriBW/yoJqOTAyCFp8KonbmX1x2Jkbu1uNdO5XnwrlSKhKbtJIglYK
         J1FaNFtaeMTrEKZh33tH1vQiQq7/B/pFcRCecH/gbbZ284/le2vvX7GxnXDh7Qrmhvuh
         65jpK7cVteA8pwDl7j8XY+MKGXasx0Hks3dDzG7mHJiWKA6glSUG4LuhPLI5GnsO9F+h
         5+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752481935; x=1753086735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0M6siWvZJnp6SHGUTLYeoItEe86brhosUCvwv3Sj6g=;
        b=F/9SWvk6CZLP7NzacUuDEmNmGH7Yp1K5pU/cKR6/cI91499pYJ5KCnLK/b1SoNra2c
         JQPIGrsQU1CHpyY/jhr4GsojSItkTArP/vIRYu9AKSudmcA3fAMl6MIwNUGe/l/y7RsJ
         Z+7mYt6XEfSxZ+y31Z038AOhJXO90+yu5Z445dmpKcIcdjlbFzEK5Q3sTo/HefJCoLSZ
         RZy9z6ud2e1VAG0E3TEU74wz7XaEHnIEmX61UHhUpnNM4VrOyB23jEf/u6LHqEdissPP
         N0HXvLweJbj1MJDk1ET8zean5++Ae7FlauWcsDsvULF66Ln3bg8kYqiKmd38F3TMfUK1
         cicA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWCcCXB3A3P1rV3rBJI2wQzljjWHevT0vDvd9JLShm/sqIrLVt2o9/1to05jkLtSiRIkUxEWMP8mWLHvuZHk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtpMX7ZPeI2a3FjtT0PoCUep/FvLad5p296zRVeQGECdBHbltq
	AdvklykbG2D+Nbaw9Oi6IGWbLIMJF7agzQLn0ZhhSKW/k7DebqhnMyd0SGgKVEoRLj5jS5o2QnG
	G2XxwTJLJ5ja+PUwkq3NnPXV7yUu7nFw+4OdjYmXE
X-Gm-Gg: ASbGncv2RIaUxHNRa7W+c0GTc3LEA/pjJLJXe45nk5+tDFWSOw3Jt1NoufIj9th84pd
	vsWxUQaZDZiQfKoYww3ZjWV1TwxiXLNoKtqfsPtQqI4QHGmKSHSwAKGlflB1EEf5/a6Qfu8JRu2
	4zEd4jMLO59ncGKUssYeBADOxTvAmJiYaQTNEZYRIJdfCFxpvp+BZwSP2elsbul9H/F8bds1fpK
	L7026mlYOV7tjm/8bQp1yLtxrZ1nZvcqlD7Rw==
X-Google-Smtp-Source: AGHT+IGclyUn0o5DxCYmV+W1r6lMYYeWyJ2l3l3YKph27RKIvJiE9F17q7jK7UBpfFkKyhlun6BZzlofd+c8jNIzjXI=
X-Received: by 2002:a05:6122:4b86:b0:534:7570:b68 with SMTP id
 71dfb90a1353d-535f4558182mr6039352e0c.0.1752481934473; Mon, 14 Jul 2025
 01:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250711003502.857536-1-raduvele@google.com> <20250711003502.857536-2-raduvele@google.com>
 <aHCPDXonAevxkMho@google.com>
In-Reply-To: <aHCPDXonAevxkMho@google.com>
From: Radu Vele <raduvele@google.com>
Date: Mon, 14 Jul 2025 10:32:03 +0200
X-Gm-Features: Ac12FXwKEEUbGRgte43q8kv8Q9D0mBi3-qbFkUsMFkQsG4LANLOGjwjdka7KiXE
Message-ID: <CACKy9TJHtA5K2YqdNdnMuTvOsz4OCkRds4Hbj8aZdK5VXpMgWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Add lock per-port
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 6:12=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Jul 11, 2025 at 12:35:02AM +0000, Radu Vele wrote:
> > Add a lock associated to each port to protect port data against
> > concurrent access. Concurrency may result from sysfs commands
> > and ec events.
>
> I realized the critical sections are way too large.  What exactly data th=
e
> lock tries to protect?  Is the race possibility introduced by any previou=
s
> commits?  Please provide more context.

With the implementation of the role swap operations from the previous
commit (and also enter usb mode from another recent commit) we
introduce the possibility of concurrent access to the cros_ec_typec port
data from the userspace (e.g. trigger a power role swap from sysfs) vs
from EC events (e.g. partner triggered a role swap that we accept).
This is the main reason to propose a per-port lock. This way we ensure
we protect the state of each port in the cros_ec_typec driver.
