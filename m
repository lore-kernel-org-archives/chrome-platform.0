Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65C1F4261
	for <chrome-platform@lists.linux.dev>; Thu, 31 Jul 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978185; cv=none; b=ml6NBTGwWrbL/1u01P6z+dbrxGKEj6BtWCdQOaXQCRq9BUxlOjhg4n0ElpIQF5gbJdH7eBJzAIC+uBbGmpFT+BtcNezuPrXxumq21E+cXoPZb9Z/aQYP5wHVFoZLEqnQMuyzYF1YcQvUNhg9Bm1xlDE2KE0UyQqX5WG6NtHQItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978185; c=relaxed/simple;
	bh=UUbVgaWG1FBSW2udf9aTCPmOnPAnABB3Ya1UbXyvUfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmtiylH9aoSoNU0LlePW2RhqHzfQE5bdqMLfVIAABxgRr2uUNMLHi4FHx0mYG7TkFXdJ8qMQ69Frnh6NVcrPgbz/iqTyG0SkzHEwaENIONRJeniCfc353L4I5yuL8u4ZDIZ9k6c4fEW2OK1EKLLVA1g1dGeDjfu9Aty5cO9URM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DwHLK5k0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DwHLK5k0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313154270bbso648093a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 31 Jul 2025 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753978183; x=1754582983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8c1vs297OuDQhw1rF/WqVEVYzpa4jaap14+9/4mG/U=;
        b=DwHLK5k0CUOSMXeoEbHAMBd7s0ydG8NbSIiOA+KvoBEALE+KEYjcckj7ZHxuKrvxbi
         1D6p+NE79i6oQFANwvoRrmcFfRtzcBS2hEyn7erYr41Jvp3F4FC0/Ekn6tuE4BVU5vnT
         qg9PnucN2ZC6XqgeerhOMNOQZ8AGILnI+SWVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753978183; x=1754582983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8c1vs297OuDQhw1rF/WqVEVYzpa4jaap14+9/4mG/U=;
        b=WI8pmfaWzPUsDkrBlU8EQnYggH5KHhksBlevGxPgwig5/DSbTCYo4ceDICX68AdV7C
         9gnKmQ6HlS/xz5a+qyhNdArLru4Q3b9YW6EfI2OjR1Edn9n+JG2e5RfLRoReG1vRxtNp
         O+r+kv5597LmF4q4Xmqh1sIh7PeVzLoUwjSjlmmAL0gOeGhHvTKREm9ihWRu69N9MUEi
         LXDMfJDQNFKN6MtDVnFaqIZXD67yAvCbc8xpXka2BYq2y7fvJ2JU12eRTNRrV1ClEnbI
         /27bppGvtIi2KElXchjHvRc66ZOdmwhDIVKXIfRdTdZuIaIAMjMhv55git4NH11/yp5w
         if7A==
X-Forwarded-Encrypted: i=1; AJvYcCVuov1wGTsMDNzCfsD3pT9OBsFGBM7b/r5tjeK+V/LnsdafvnHe+SwrzPfjUZ/BlPMsVA4aSDAyg40ZnvxS0Aw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvAokLZP015egpujyn1BIdtw013OiQyLZz7LytTIuYpueovuEU
	NBaapUw5/annhRKiuVo+D1CCm1r3uKlTvDnbGoJ8HF44CP/W1CdatQZob1vHeAiyJ30y08Ri74d
	vzaqf05uOt+soQgSmmZA7/3VvIdtxmdh4eaFNF+FB
X-Gm-Gg: ASbGncuxK3PnWGXFmLgEtwOx+w7i/CPUszmxTgsxRfJg3aQy7GaaSWTUwR4HvsGLh8e
	3YW5yvniLTf09J1YS9qWFUMErD2YctLDSCi4sWIheQshzAmjR8Ua8YJrxxX50/oWuMaT28DjB6Y
	dQsJAhvObdFSpHnNjtAFmqElVrCBt3YH6+v47ohXlyhhIaWLkmlmamXR3kFcpCupGo9JGvucWDN
	L3VaEzNj3FqDUu822YGG62Ru8tHRmGiKQ==
X-Google-Smtp-Source: AGHT+IH+w2hB9w50GxzxGlBRwTPS/DAt66aQNsJJcSJh0eSSExp3OpaWYiihvtaGYVhasRRauJvVuomLJpIbicNxMs8=
X-Received: by 2002:a17:90b:3d07:b0:31f:1a3e:fe31 with SMTP id
 98e67ed59e1d1-31f5dde8755mr12579873a91.11.1753978182602; Thu, 31 Jul 2025
 09:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org> <2025070143-safeness-prewashed-6e9f@gregkh>
 <CAMMMRMeKyi56Pha-X86BaQwcHGCx-xu5F67HCGZg=Yhxuk==OQ@mail.gmail.com> <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
In-Reply-To: <CAMMMRMf_qc342=azkU-ceg=f-db2Z9NiONOu1_oRk8tmRL4RGg@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 31 Jul 2025 18:09:30 +0200
X-Gm-Features: Ac12FXx94P8Xkhok4AYIXJ8K2qdSo2AVg2OAPp7s8VPn2NpKyCMBWlD2bnynfvo
Message-ID: <CAMMMRMeYG-bvYSiE7K8AutorvyoiXypHXv_1z62Rvh_JNazd9g@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:39=E2=80=AFAM Andrei Kuchynski
<akuchynski@chromium.org> wrote:
>
> Proposed sysfs entries for V3:
>
> - portN/portN.M/priority, RW.
> This attribute assigns a unique priority to each mode. If a user
> attempts to input a value that is already in use, the existing mode at
> that priority will have its priority incremented by one to accommodate
> the new input. Users cannot disable a mode via this entry; disabling
> is handled by `active` for altmodes and `usb_capability` for USB4 mode
>
> - portN/mode_priorities, RO.
> Provides a prioritized list of all available modes for the port,
> formatted as a space-separated string (e.g., "USB4 TBT DP").
>
> - portN-partner/mode_selection, RW.
> Write: 1/0 to trigger or cancel mode selection.
> Read:  Provides a prioritized list of all available modes for the
> partner. Modes currently in progress are indicated by parentheses
> (e.g., "USB4 (TBT) DP"). Active modes are enclosed in brackets
> (e.g., "USB4 [TBT] DP").
>
> - portN-partner.M/entry_result, RO.
> Represents a mode state for this altmode, e.g. "none", "active",
> "in progress", "cable error", "timeout".
>
> - portN/usb4_priority, RW.
> - portN-partner/usb4_entry_result, RO.
> USB4 mode, not being part of `typec_altmode_group`, introduces
> additional attributes with the same meaning as alternate modes
> attributes.
>
> Please let me know if you have any questions, require further
> clarification on these proposed sysfs entries, or have objections to
> them.

Regarding the sysfs attributes, Heikki, do you have any suggestions or
disagreements? Please let me know your thoughts.

Additionally, for consistency, it would be beneficial to use names
"DisplayPort" and "Thunderbolt3" since they are already recognized
within the kernel. Using these full names rather than "DP" and "TBT"
would be preferable

Thanks,
Andrei
