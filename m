Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A43321A2;
	Wed, 19 Nov 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547079; cv=none; b=LNaUGDGtX/FTPGcSdGybB2Ju4+uwXA3wopTbiNH1GWNfYGZZ3Ql+cAHYaaV6/dGkjc0wEEQg8MdIpDYjC+VP/tH8V6KYMQCRYfiL1+gNZhxBPDMA0IK8EdXUizy9YY9Rt5UuvW7EEGRhJqkJqup+OqNFUvu8ZGxsmUKIpu9hIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547079; c=relaxed/simple;
	bh=9yJ+lbhA1r+tZs2HhWSRDE1MNSxLVUWQeRxUtprZbcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdIrzrG7pX9g72JR1cNyLiXI22j8DG1HbXAFZbpYxHo9kIQtx/+MOLcVkHVizttzUAP07W2DUhcQCH445s9I4Oo1wb5ndsjLjlj4kS7za18brL5Cfu5Y9yCnmav1LD1pyAUH0VZK+WeEXQOCUImoam2gs6eC6lgkmJNjfVMgSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntiFG0WZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntiFG0WZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E032C19423;
	Wed, 19 Nov 2025 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763547079;
	bh=9yJ+lbhA1r+tZs2HhWSRDE1MNSxLVUWQeRxUtprZbcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ntiFG0WZwLyi6cuJC0HDINEibfnqLYU5uNGylwSu3kSmO6ugkS2JzJ9ndesijZcbj
	 lga6O61md6Wi7yuhy44jmFO0Dz1Ki/XqMKCC7iKQuZIkzDTnvYfZt5zu43OQJ6YY2J
	 6htuf5RF2XoaKvhsx0+lv71jlWcRAQyJqfVzppcKSTA7IRC8Qz/DxrjOJ4FvI4wRTj
	 PWMWgjpUKOdVoD7osLAW+gEZTBlurLEUyqf5o8s/5MGld6ljJrMrqjf7E9JuFe7ToM
	 ni47TCNZHfJBx9emo+BKHScQS9WPtJB6yr4gv2VjOEufqQPZFkIE2cDx0hDnDRmdpd
	 OgD2G6CflFEUQ==
Message-ID: <c1e46e07-c4b6-45c7-8a03-3ac972b1018f@kernel.org>
Date: Wed, 19 Nov 2025 11:11:14 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251119071126.1719405-1-wenst@chromium.org>
 <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
 <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com>
 <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org>
 <CAGXv+5HePVim+-fx0bG-geBHp3kLQbNGLyknGRx=LgLZ7H+DUQ@mail.gmail.com>
 <d8194781-56b1-49d5-a3a0-31360ee208b3@kernel.org>
 <CAGXv+5FwrudX5JwbSTkRMNjOUPmbjzP+qJ7FMrgX0Jj52HvrQw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAGXv+5FwrudX5JwbSTkRMNjOUPmbjzP+qJ7FMrgX0Jj52HvrQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2025 10:36, Chen-Yu Tsai wrote:
> On Wed, Nov 19, 2025 at 5:26 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 19/11/2025 09:54, Chen-Yu Tsai wrote:
>>> On Wed, Nov 19, 2025 at 4:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 19/11/2025 08:32, Chen-Yu Tsai wrote:
>>>>> On Wed, Nov 19, 2025 at 3:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
>>>>>>> Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
>>>>>>> insert device specific properties into the coreboot firmware node when
>>>>>>> there are valid values.
>>>>>>>
>>>>>>> Document these properties in the binding.
>>>>>>>
>>>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 +++++++++
>>>>>>>  1 file changed, 9 insertions(+)
>>>>>>>
>>>>>>
>>>>>> TXT files cannot receive new properties. You need to first convert to DT
>>>>>> schema.
>>>>>
>>>>> OK. Let me look into this.
>>>>
>>>> After the conversion you will hit another problem - you need vendor
>>>> prefixes for these, because only generic properties can come without
>>>> them. Otherwise (without vendor prefix) these would define the type for
>>>> all other bindings, which probably is not what we want.
>>>
>>> I understand the concern. But given it's specifically under the
>>> /firmware/coreboot node, which is inserted by coreboot, doesn't that
>>> already serve as a namespace or vendor prefix?
>>
>> Unfortunately not or not completely. Properties have single type
>> globally (with exceptions). This means whatever you write here for
>> board-id will affect every possible future board-id property.
> 
> IIUC you mean it applies to every "board-id" property that is under
> a node that matches the compatible "coreboot"?

Type applies to every board-id property.

> 
> Is there any way to limit the match also by path (and not just node name,
> which I know is possible)? If we can limit the scope then maybe it works
> out?
> 
> Or perhaps you are worried that some other new binding with a broader
> scope defines "board-id" and thus conflicts with this one?

Yes. You basically define now type for all "board-id"s.

> 
>>>
>>> FWIW the ship has already sailed for naming. The first three properties
>>> were added to depthcharge [1] and coreboot [2] in 2018. The last property
>>> was added to depthcharge in 2023 [3]. That is what has shipped in immutable
>>> firmware on ARM-based Chromebooks since the RK3399 days. The coreboot
>>> change was presumably added for other devices.
>>>
>>> This change only serves to document what the firmware already provides.
>>> Whether they should be grandfathered in or not doesn't change what the
>>> firmware already does; it just makes it more well known. It's not going
>>> to have any effect on validation either, as the properties are supposed
>>> to be inserted by the bootloader, not added statically to dts files.
>>
>> If you convince Rob then it's fine, but I don't want to accept
>> downstream solutions just because they exist. This opens the door for
>> every vendor to implement what they want and later ask for forgiveness
>> ("oh it is already there and we cannot change shipped devices"). I mean,
>> this was fine back 2010, but that was 15 years ago.
> 
> I completely understand, and yes this does have that feel to it.
> But FWIW the change is in upstream coreboot.

Oh, that is something coreboot should fix - I went to their repo and:

git grep board-id

and there are no bindings (no ABI documentation), which could imply they
use Linux bindings (great!) but then this should have been sent to DT
Linux list for review and included in the kernel bindings.

I understand this is a different case than vendor doing whatever they
want in downstream, but still it is a similar one - "project is doing
whatever they want inside" - and it does not make me happy.


Best regards,
Krzysztof
