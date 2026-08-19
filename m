Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73C248F4B;
	Wed, 19 Aug 2026 05:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116573; cv=none; b=DJ43n3wPfMwdwr+rWr5/1qOVliQfq2Pz5tHEkKbGASoG/zVlpayyZSj1NakpQNGC2djrXVn6EdkqkiqKXu7lNQPEkKBm1Jrcs7ikpenJWnipAjZNm5AtgnGr9YbcfKJ3tQ4IEKgk7FzseDPsDudkmmCBwPxyMmwMZBIxTbVieRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116573; c=relaxed/simple;
	bh=ysWv2lA6YcuR5CpPgOdUsojJKDR79C3Ru4o9bwvf2Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br+0pauy2A7xkEBn6tp7steQ7TE+ZD+SQWCvXSDY8Hn8aLy44YlFuDKOo1bJorw4ZEW8Bxio0RFv9PMJY8aksBR33eNl6ncUDIJM5cuay5hrPUtAXN2UQ8An8j9HB5RYqczdl7NSOZOgXJaPnlCMUKBPXYvg8qe5vo99xSY2Sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgbaPQog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgbaPQog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAB71F000E9;
	Wed, 19 Aug 2026 05:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787116571;
	bh=fmVu6e/q3e/4eJmbVX0z1kjMSP1G55lpFlFhdf4704U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgbaPQog9u/O96Gf0gJbDKl6PNxsOdQAqPM9TyCvARjKmezT0cHXFR/Ipsa5bMIhf
	 29fPqRsnybx3hJxGGY7bIN1qEARTImugsyL212texd4MBR0DcRIWZePA1+AyIquwxu
	 U0wi9SWQlACpazzfcaw+1K0HwIV+oAGINMNkdEqHysB4azRncJeNnExuM6YVBe6Bke
	 Ug2R8N12izr5N8WH6PxdsEdkxTs56U8tsQ+5WDHN+LncM7D2V3X2+DZO86KlQ70Itw
	 RUkSNQTRTZVKyOtb/BwLX6rrjLT/xhxW9dMTNcx5DiqMpM3iY+WjJv16EnbyEnTs9i
	 oT884W6fiKPHQ==
Date: Wed, 19 Aug 2026 05:16:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, tomhughes@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_proto: Fix deferred response
Message-ID: <aoU8GDNRGiyOZhQZ@google.com>
References: <CA+Dqm338B_5unrSnb2ztcuA2xakNj_Lp76mEXQpwmOCEXm7cYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Dqm338B_5unrSnb2ztcuA2xakNj_Lp76mEXQpwmOCEXm7cYw@mail.gmail.com>

On Tue, Aug 18, 2026 at 02:35:43PM -0400, Rob Barnes wrote:
> diff --git a/drivers/platform/chrome/cros_ec_proto.c
...
>  static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
> -					struct cros_ec_command *orig_msg)
> +				       struct cros_ec_command *orig_msg)

It looks like the patch was generated against to wrong base.

> @@ -171,8 +171,31 @@ static int cros_ec_wait_until_complete(struct
> cros_ec_device *ec_dev,
  ^^^^^^^^^^^^^^^^^^^^^^^

Please check your tools.  The hunk header shouldn't wrap.

> @@ -185,7 +213,7 @@ static int cros_ec_send_command(struct
> cros_ec_device *ec_dev, struct cros_ec_co

./scripts/checkpatch.pl --strict:
  ERROR: patch seems to be corrupt (line wrapped?)

> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c
...
> @@ -2858,7 +3008,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>  	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
>  	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
>  	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
> -	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_normal),
> +	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte),
>  	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
>  	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),

It looks like the patch was generated against to wrong base.
