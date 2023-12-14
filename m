Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB966AC2
	for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHQSIbUZ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e1e1f608cso545e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 15:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702595138; x=1703199938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cphvl2wyh1GyJLsprr0iWOYpnSYMRlz6FGZQv5qE9aY=;
        b=AHQSIbUZKOzl07CNOIGHMWR8HYDi/nAkW7BjhGmm40oFZybCGwGBjjJNaRnbcfkEyK
         NGucXh6IpvKCHQazPkj+kj0oHVnzS+sQt10aWY+xovVj4rqSZKPqg0ccAuBgsO8ZBNsp
         2fduorXG3GGX8226pTw7/Q3m2ZmKDDRwNievLhpvXpzBprYoyLDwiggV83IJqaPIi7GL
         oVQ8JjF3/9Oaf6akNfoOULx/n7npMHL4IVDCUs2+J0hq/gQIKXBJh9eRL1VI8r6oCvAc
         aR78BKnK4nv5QfMqTroBwZ+inIrgp5bQRjKlcfMJDCvR0MGKygDq7AnT4IQcZrOxoZL+
         h1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702595138; x=1703199938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cphvl2wyh1GyJLsprr0iWOYpnSYMRlz6FGZQv5qE9aY=;
        b=Daod++sTyKJelFqisXv+oy7rtxHrKSgzTjPOYVglsS8fZpl5ADmjAaU1GJ+2tQFDU9
         BRsbLuyZcPuV8yZ7KSvTy0SFCZ5e6vh5CKwdKGOOL15JIoUm6RhmyNXZop7oTfG+h19J
         LohOWWUBmDcQ6Fov/00nvn7WRxQSTi2taTriyAi8UmpcGl0gdWnVW27KssmoPWjeMUD6
         BQNb9Bvfzdm7eCY/WmBZGeRIeuaRn9q+p3TGeZ2ZIVwFz1SeXXKUNML+UWIkTQYvZp8l
         eO0o6v0pRBQx+u08rIMY8YrSxBZ2RY47boxcOI/UQnhZjiodCs9/TT+Uw09utCMxCvJ/
         7AYA==
X-Gm-Message-State: AOJu0YxwuvU/jC0U/HFvjfdCgDI+gZvS2gJF5CmUhUdL+ruPj86PX9Y8
	oHcIVhfYqzyu9sScsPzoXj9pWgnEAa+AJO0/PvhUQ30Dg+1FliEX3U8+FaAt
X-Google-Smtp-Source: AGHT+IGXb16j/LfeqtBoeO0x3fK0w00V9lsrj7lfha/L4eV4jsQEDQaHUg/9HPGFB+bKX/beNWh7ACqwFXJFkQTQH1Q=
X-Received: by 2002:a50:c082:0:b0:54c:9996:7833 with SMTP id
 k2-20020a50c082000000b0054c99967833mr718937edf.7.1702594641723; Thu, 14 Dec
 2023 14:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com> <20231207090738.15721-13-rdbabiera@google.com>
 <ZXGt2drhV/K+qtTG@kuha.fi.intel.com>
In-Reply-To: <ZXGt2drhV/K+qtTG@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 14 Dec 2023 14:57:10 -0800
Message-ID: <CALzBnUEvKWScSxjE60ONDc7KsUPDwy48rWrSKATyr2D2nQBimg@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] usb: typec: bus: provide transmit type for
 alternate mode drivers
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, pmalani@chromium.org, 
	bleung@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, badhri@google.com, 
	tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Thu, Dec 7, 2023 at 3:34=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> Instead of forcing this change immediately on every existing user of
> that API, why not supply separate API for the cable alt modes?
>
> Although the SOP* communication is the same in most parts, at least
> Attention (and probable some other messages too) is not valid with
> cable plugs. So maybe it would be more clear to just separate SOP
> communication from SOP Prime/Double Prime in the API?

Your idea makes much more sense and simplified implementation, so
I added it to the next version of the patch set.

Thanks a lot!
---
RD
