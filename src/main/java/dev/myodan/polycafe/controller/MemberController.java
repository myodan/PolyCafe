package dev.myodan.polycafe.controller;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.service.MemberService;
import dev.myodan.polycafe.util.Pageable;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/members")
@AllArgsConstructor
public class MemberController {

    private final static String MEMBER_PATH = "members";

    private final MemberService memberService;

    @GetMapping
    public String listMembers(Model model, Pageable pageable) {
        model.addAttribute("list", memberService.getList(pageable));
        return MEMBER_PATH + "/list";
    }

    @GetMapping("/add")
    public String showAddMemberForm() {
        return MEMBER_PATH + "/add";
    }

    @PostMapping("/add")
    public String addMember(Member newMember) {
        memberService.save(newMember);
        return "redirect:/" + MEMBER_PATH;
    }

    @GetMapping("/edit")
    public String showEditMemberForm(Member member, Model model) {
        model.addAttribute("item", memberService.getItem(member.getId()));
        return MEMBER_PATH + "/edit";
    }

    @PostMapping("/edit")
    public String updateMember(Member updatedMember) {
        memberService.update(updatedMember);
        return "redirect:/" + MEMBER_PATH;
    }

    @GetMapping("/delete")
    public String removeMember(Member member) {
        memberService.delete(member);
        return "redirect:/" + MEMBER_PATH;
    }

}

