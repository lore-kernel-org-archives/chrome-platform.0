Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6922D795
	for <chrome-platform@lists.linux.dev>; Wed,  2 Jul 2025 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442234; cv=none; b=G1iefKdyYguMJXCUSKNusaJHJLWyvYVMdClzxCl9LZE5OgxPazNpjgG2AUYcwco+BC1zOAp3Asl1+AK1iwmfwirfZUPV8ps/yU98itFM99DSHjVXcF2PHRqfBSgmvBicDKj6p4CaoHQhc2z/h7NSgCnwEFZ5Rwp5HaKpSWCc7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442234; c=relaxed/simple;
	bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqMLEpgpqr7b3S6oaD5HNSSGJ0VW+EQ73c8b2XaxxzOBBjqZP4YKqID8pNrwL07tLzdnqc1oz38H5PPFbeSSsv9Nncp0c7Ff4zUBsvHIPuxwEmz/0LnQYMtmGCiZUSWOjOE47IRUmLdB8hb8+t3MzIB/VLs09XwKVueIR92CMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ASBH87p; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ASBH87p"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e5d953c0bso72761127b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 02 Jul 2025 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751442232; x=1752047032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
        b=4ASBH87pKOXwXFZsAqtj4eYkfw8m1jieZ/Dh8uwLiNdxx7f+EdgAotnCHjSJw1afG+
         9y8fwXIbwvTidImzBARvzjG6tk0pqqxLRkgBjczyAOoPGmIqDQGrmETyIXFxzjn9sTA1
         xpf7sK6N4zWIRR6ndhFAFr94Ni7biI8KjOtxhlsF/hRU0hLHlPosxZXMZh27cmDUxe1E
         +mutoaX9pwKodmhSneuJanhMVMTW61EHA+0LkwEM6XuCSfh29lClFIIbOoAUPseDsF01
         dMWKeHpVQS7ljXFeLIjzjgZIaEhAl55BqmDK8/QXItUnmWYT0KVZLVayEMlWKai7WuAZ
         +4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751442232; x=1752047032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
        b=EbBZQFJcfvZ+VQnrGXC6y/0Ifb2gghyUpdCZFy3MjIZiZcHi5yn8piz7nEmjaVwgD2
         JmNytkuOplmooPfLMA6t39ilvVfGD6ycR3nxDPGzfrHRhoC6K0hmAScJad2MXNAHUi1P
         FfT0XhYPD2Yf0AuAOcqFi4iA7YENgHMEKrRszWzLPLLmbqn9gz5O+kSzDVPV4jDlLVuj
         idDo4vsy/uXMogv9XK6R0jIyCKIx649zHbU+b0d7Qs5wr4cyBsGIA5+wRjZ0oTs/O9eb
         8NtamRiie024zAM9PfRGTaTX4qob9QcHfYF4eaFC1ohRXvzJHyhEg0m3GeESGrvntTQH
         rv9w==
X-Forwarded-Encrypted: i=1; AJvYcCVzJDIf+l5PHC9VnI5ot7s09TwAnFFR7PyY0qEPcIjBmQCwg6SaqeP/9Omf54/zLZcPid0bzui636BFz55O55w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJiChRuL2Dvnt0Qk3vuqxXi2EQeHkufGcfzUj2izlJMyY1N9jS
	TqlpHKzTWR0IurwtT3BTRFZloh1C+DgBb832deBBbxeXYS1rNnlYKFwLcy6FIvrR+zESftwXiUe
	aSB3D/6x53G37BnnVFzGF0WZnjdMkWlrgAO4hPr2v
X-Gm-Gg: ASbGnctwqYQGBb9SrrX2Yqg8TFj2/YLG5bKFkY7t1vlQ43TbDF7XHQLwUysE0pzzKJL
	G2ae0s98m5TzRCifZug6MDQLRItnth67W2pmo7aguytv2V5ROeZRjZsgm0WOKmRI0HJXFq8x6q6
	HxrGvBPNfxsNGy3qiK0kra37a7k+a22jN9rIhI03IP7S+t
X-Google-Smtp-Source: AGHT+IHJ5KSoH5fJcH5bRD8u0uju23Ajgzfe2GuZ+dlV9bVuz6oF/DawUNtQuOoM8rfBTiKumHPVsJaPfZVKygoRYhU=
X-Received: by 2002:a05:690c:4:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-7164d5c9ad7mr21914977b3.29.1751442232013; Wed, 02 Jul 2025
 00:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com> <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com>
In-Reply-To: <aGSuS81Psqm_Ie4N@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Wed, 2 Jul 2025 09:43:40 +0200
X-Gm-Features: Ac12FXyjHURaGeGORQBNZGxM0SsXHPq_jf4zJZWaq-J26bz0217ia66mA1Lhlmk
Message-ID: <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> They doesn't look like shortcomings to me. The corresponding destructor
> callbacks have to be called when a device is removed anyway.
>

Yes, anything related to USB communication itself has to be freed, but
freeing the cros_ec_device structure and calling the cros_ec_unregister
function can crash the system if any of a userland application has the
original file cros_ec open and tries to send a command. The chardev driver
is not aware that the device has been removed and will try to access the
removed structures.

> Instead, re-using the same inode for the userland interface however
> *silently* swapping the underlying devices makes less sense to me.
>

We are sure it is the same EC device, so why do you think accessing the
same inode makes less sense? It is a case for specific interface, that reboot
causes reprobing, which is not a case for other interfaces. I believe
it should be
transparent for the cros_ec device user, what interface type is used
e.g. if it is
SPI, you can reboot the EC device and wait until it responds to a next command,
but if it is USB, you would need to reopen the cros_ec file after reboot.

> My point here is: to let userland programs be aware of the underlying
> device has been removed.
>

I got your point, but they are informed with a proper return code. The
host command
communication doesn't have context. Every command is independent, so userland
programs can not assume any state of the EC device e.g. reboot can
happen. I think
behaviour of the cros_ec file is not a good way to inform the userland
programs that
there were reboot, sysjump etc. There are special commands/events for that.

> What are the reasons for disconnect and reprobe? From your previous message
> and code comment, are they "reboot, sysjump, crash"? Would it happen
> frequently after AP boot?
>

Yes, every boot "from the beginning" , including sysjumps. It depends
on a EC device
type, but it can happen e.g. after AP reboot (RWSIG jumps to RW, it
depends on boot time),
during firmware update procedure, rollback region update etc.

> Note: we are talking about a EC-like device here. For a real EC either reboot
> or crash, the AP will be reset.

That's true. The problem doesn't exist for the real EC device.

> No, I don't think so. I think all EC-like devices share the same concern
> regardless of the transport medium (e.g. SCP over RPMSG, ISH over ISHTP).

Yes, you can run a userland program that opens a cros_ec file and constantly
sends commands e.g. ectool stress, and then manually unbind the ec
device, but I believe it can cause some crashes/memory leakage. I don't think
all drivers are adjusted to hot-plugging.
